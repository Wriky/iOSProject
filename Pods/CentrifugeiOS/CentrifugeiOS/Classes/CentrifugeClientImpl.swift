//
//  Clients.swift
//  Pods
//
//  Created by Herman Saprykin on 20/04/16.
//
//

import SwiftWebSocket

typealias CentrifugeBlockingHandler = ([CentrifugeServerMessage]?, NSError?) -> Void

class CentrifugeClientImpl: NSObject, WebSocketDelegate, CentrifugeClient {
    var ws: CentrifugeWebSocket!
    var url: String!
    var creds: CentrifugeCredentials!
    var builder: CentrifugeClientMessageBuilder!
    var parser: CentrifugeServerMessageParser!
    
    var delegate: CentrifugeClientDelegate!
    
    var messageCallbacks = [String : CentrifugeMessageHandler]()
    var subscription = [String : CentrifugeChannelDelegate]()
    
    /** Handler is used to process websocket delegate method.
     If it is not nil, it blocks default actions. */
    var blockingHandler: CentrifugeBlockingHandler?
    var connectionCompletion: CentrifugeMessageHandler?
    
    //MARK: - Public interface
    //MARK: Server related method
    func connect(completion: CentrifugeMessageHandler) {
        blockingHandler = connectionProcessHandler
        connectionCompletion = completion
        ws = CentrifugeWebSocket(url)
        ws.delegate = self
    }
    
    func disconnect() {
        ws.delegate = nil
        ws.close()
    }
    
    func ping(completion: CentrifugeMessageHandler) {
        let message = builder.buildPingMessage()
        messageCallbacks[message.uid] = completion
        send(message)
    }
    
    //MARK: Channel related method
    func subscribe(channel: String, delegate: CentrifugeChannelDelegate, completion: CentrifugeMessageHandler) {
        let message = builder.buildSubscribeMessageTo(channel)
        subscription[channel] = delegate
        messageCallbacks[message.uid] = completion
        send(message)
    }

    func subscribe(channel: String, delegate: CentrifugeChannelDelegate, lastMessageUID uid: String, completion: CentrifugeMessageHandler) {
        let message = builder.buildSubscribeMessageTo(channel, lastMessageUUID: uid)
        subscription[channel] = delegate
        messageCallbacks[message.uid] = completion
        send(message)
    }
    
    func publish(channel: String, data: [String : AnyObject], completion: CentrifugeMessageHandler) {
        let message = builder.buildPublishMessageTo(channel, data: data)
        messageCallbacks[message.uid] = completion
        send(message)
    }
    
    func unsubscribe(channel: String, completion: CentrifugeMessageHandler) {
        let message = builder.buildUnsubscribeMessageFrom(channel)
        messageCallbacks[message.uid] = completion
        send(message)
    }
    
    func presence(channel: String, completion: CentrifugeMessageHandler) {
        let message = builder.buildPresenceMessage(channel)
        messageCallbacks[message.uid] = completion
        send(message)
    }
    
    func history(channel: String, completion: CentrifugeMessageHandler) {
        let message = builder.buildHistoryMessage(channel)
        messageCallbacks[message.uid] = completion
        send(message)
    }
    
    //MARK: - Helpers
    func unsubscribeFrom(channel: String) {
        subscription[channel] = nil
    }
    
    func send(message: CentrifugeClientMessage) {
        try! ws.send(message)
    }
    
    func setupConnectedState() {
        blockingHandler = defaultProcessHandler
    }
    
    func resetState() {
        blockingHandler = nil
        connectionCompletion = nil
        
        messageCallbacks.removeAll()
        subscription.removeAll()
    }
    
    //MARK: - Handlers
    /**
     Handler is using while connecting to server.
     */
    func connectionProcessHandler(messages: [CentrifugeServerMessage]?, error: NSError?) -> Void {
        guard let handler = connectionCompletion else {
            assertionFailure("Error: No connectionCompletion")
            return
        }
        
        resetState()
        
        if let err = error {
            handler(nil, err)
            return
        }
        
        guard let message = messages?.first else {
            assertionFailure("Error: Empty messages array")
            return
        }
        
        if message.error == nil{
            setupConnectedState()
            handler(message, nil)
        } else {
            let error = NSError.errorWithMessage(message)
            handler(nil, error)
        }
    }
    
    /**
     Handler is using while normal working with server.
     */
    func defaultProcessHandler(messages: [CentrifugeServerMessage]?, error: NSError?) {
        if let err = error {
            delegate.client(self, didReceiveError: err)
            return
        }
        
        guard let msgs = messages else {
            assertionFailure("Error: Empty messages array without error")
            return
        }
        
        for message in msgs {
            defaultProcessHandler(message)
        }
    }
    
    func defaultProcessHandler(message: CentrifugeServerMessage) {
        var handled = false
        if let uid = message.uid where messageCallbacks[uid] == nil {
            assertionFailure("Error: Untracked message is received")
            return
        }
        
        if let uid = message.uid, handler = messageCallbacks[uid] where message.error != nil {
            let error = NSError.errorWithMessage(message)
            handler(nil, error)
            messageCallbacks[uid] = nil
            return
        }
        
        if let uid = message.uid, handler = messageCallbacks[uid] {
            handler(message, nil)
            messageCallbacks[uid] = nil
            handled = true
        }
        
        if (handled && (message.method != .Unsubscribe && message.method != .Disconnect)) {
            return
        }
        
        switch message.method {
            
        // Channel events
        case .Message:
            guard let channel = message.body?["channel"] as? String, delegate = subscription[channel] else {
                assertionFailure("Error: Invalid \(message.method) handler")
                return
            }
            delegate.client(self, didReceiveMessageInChannel: channel, message: message)
        case .Join:
            guard let channel = message.body?["channel"] as? String, delegate = subscription[channel] else {
                assertionFailure("Error: Invalid \(message.method) handler")
                return
            }
            delegate.client(self, didReceiveJoinInChannel: channel, message: message)
        case .Leave:
            guard let channel = message.body?["channel"] as? String, delegate = subscription[channel] else {
                assertionFailure("Error: Invalid \(message.method) handler")
                return
            }
            delegate.client(self, didReceiveLeaveInChannel: channel, message: message)
        case .Unsubscribe:
            guard let channel = message.body?["channel"] as? String, delegate = subscription[channel] else {
                assertionFailure("Error: Invalid \(message.method) handler")
                return
            }
            delegate.client(self, didReceiveUnsubscribeInChannel: channel, message: message)
            unsubscribeFrom(channel)
            
        // Client events
        case .Disconnect:
            delegate.client(self, didDisconnect: message)
            ws.close()
            resetState()
        case .Refresh:
            delegate.client(self, didReceiveRefresh: message)
        default:
            print(message)
            assertionFailure("Error: Invalid method type")
        }
    }
    
    //MARK: - WebSocketDelegate
    func webSocketOpen() {
        let message = builder.buildConnectMessage(creds)
        send(message)
    }
    
    func webSocketMessageText(text: String) {
        let data = text.dataUsingEncoding(NSUTF8StringEncoding)!
        let messages = try! parser.parse(data)
        messages.forEach { message in
            print(message)
        }
        if let handler = blockingHandler {
            handler(messages, nil)
        }
    }
    
    func webSocketClose(code: Int, reason: String, wasClean: Bool) {
        if let handler = blockingHandler {
            let error = NSError(domain: CentrifugeWebSocketErrorDomain, code: code, userInfo: [NSLocalizedDescriptionKey : reason])
            handler(nil, error)
        }
        
    }
    
    func webSocketError(error: NSError) {
        if let handler = blockingHandler {
            handler(nil, error)
        }
    }
}

