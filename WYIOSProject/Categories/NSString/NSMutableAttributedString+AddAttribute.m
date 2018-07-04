//
//  NSMutableAttributedString+AddAttribute.m
//  ASAttributedString
//
//  Created by 廖伟魏 on 16/9/2.
//  Copyright © 2016年 廖伟魏. All rights reserved.
//

#import "NSMutableAttributedString+AddAttribute.h"

@implementation NSMutableAttributedString (AddAttribute)

- (NSMutableAttributedString *)changeColorWithColor:(UIColor *)color totalString:(NSString *)totalString subStringArray:(NSArray *)subArray {
    //单纯改变一句话中的某些字的颜色
    if (subArray.count > 0) {
        for (NSString *rangeString in subArray) {
            NSRange range = [totalString rangeOfString:rangeString options:NSBackwardsSearch];
            [self addAttribute:NSForegroundColorAttributeName value:color range:range];
        }
    }
    return self;
}

- (NSMutableAttributedString *)changeSpaceWithTotalString:(NSString *)totalString space:(CGFloat)space {
    //单纯改变句子的字间距
    long number = space;
    CFNumberRef num = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt8Type, &number);
    [self addAttribute:(id)kCTKernAttributeName value:(__bridge id)num range:NSMakeRange(0, [self length])];
    CFRelease(num);
    return self;
}

- (NSMutableAttributedString *)changeLineSpaceWithTotalString:(NSString *)totalString lineSpace:(CGFloat)lineSpace {
    //单纯改变段落的行间距
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpace];
    [self addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [totalString length])];
    return self;
}

- (NSMutableAttributedString *)changeLineAndTextSpaceWithTotalString:(NSString *)totalString lineSpace:(CGFloat)lineSpace textSpace:(CGFloat)textSpace {
    //同时更改行间距和字间距
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpace];
    [self addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [totalString length])];
    
    long number = textSpace;
    CFNumberRef num = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt8Type, &number);
    [self addAttribute:(id)kCTKernAttributeName value:(__bridge id)num range:NSMakeRange(0, [self length])];
    CFRelease(num);
    return self;
}


- (NSMutableAttributedString *)changeFontAndColor:(UIFont *)font
                                            color:(UIColor *)color
                                      totalString:(NSString *)totalString
                                   subStringArray:(NSArray *)subArray {
    //改变某些文字的颜色 并单独设置其字体
    
    if (subArray.count > 0) {
        for (NSString *rangeStr in subArray) {
            NSRange range = [totalString rangeOfString:rangeStr options:NSBackwardsSearch];
            [self addAttribute:NSForegroundColorAttributeName value:color range:range];
            [self addAttribute:NSFontAttributeName value:font range:range];
        }
    } else {
        NSRange range = NSMakeRange(0, totalString.length);
        [self addAttribute:NSForegroundColorAttributeName value:color range:range];
        [self addAttribute:NSFontAttributeName value:font range:range];
    }
    return self;
}

- (NSMutableAttributedString *)changeCharacterFontAndColerFromStartCharacter:(NSString *)startCharacter endCharacter:(NSString *)endCharacter font:(UIFont *)font color:(UIColor *)color totalString:(NSString *)totalString {
    //改变以特殊字符为标识之间的字符串的颜色或字体
    
    //开始字符和结束字符同时存在
    if (endCharacter && startCharacter) {
        NSRange startRange = [totalString rangeOfString:startCharacter];
        NSRange endRange = [totalString rangeOfString:endCharacter options:NSBackwardsSearch];
        if (startRange.location != NSNotFound && endRange.location != NSNotFound) {
            if (color) {
                [self addAttribute:NSForegroundColorAttributeName value:color range:NSMakeRange(startRange.location, endRange.location - startRange.location+1)];
            }
            if (font) {
                [self addAttribute:NSFontAttributeName value:font range:NSMakeRange(startRange.location, endRange.location - startRange.location+1)];
            }
        } else {
            NSLog(@"------没有找到开始或结束字符------");
        }
        
    } else {
        //搜索开始字符
        if (startCharacter) {
            NSRange startRange = [totalString rangeOfString:startCharacter];
            if (startRange.location == NSNotFound) {
                NSLog(@"------没有找到开始字符：%@------",startCharacter);
            } else {
                if (color) {
                    [self addAttribute:NSForegroundColorAttributeName value:color range:NSMakeRange(startRange.location, totalString.length-startRange.location)];
                }
                if (font) {
                    [self addAttribute:NSFontAttributeName value:font range:NSMakeRange(startRange.location, totalString.length-startRange.location)];
                }
            }
        }
        //搜索结束字符 从末尾开始查找
        if (endCharacter) {
            NSRange endRange = [totalString rangeOfString:endCharacter options:NSBackwardsSearch];
            if (endRange.location == NSNotFound) {
                NSLog(@"------没有找到结束字符：%@------",endCharacter);
            } else {
                if (color) {
                    [self addAttribute:NSForegroundColorAttributeName value:color range:NSMakeRange(0, endRange.location+1)];
                }
                if (font) {
                    [self addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, endRange.location+1)];
                }
            }
        }
    }
    
    return self;
}

- (NSMutableAttributedString *)changeNumberFontAndColorWithFont:(UIFont *)font
                                                          color:(UIColor *)color
                                                    totalString:(NSString *)totalString {
    //改变字符串中数字的颜色和字体
    
    NSString *regexString = @"[0-9]{1,}";
    //数字正则匹配
    NSRegularExpression *regex = [NSRegularExpression
                                  regularExpressionWithPattern:regexString
                                  options:NSRegularExpressionAnchorsMatchLines
                                  error:nil];
    
    [regex enumerateMatchesInString:totalString options:0 range:NSMakeRange(0, totalString.length) usingBlock:^(NSTextCheckingResult *result, NSMatchingFlags flags, BOOL *stop) {
        
        NSRange resultRange = [result rangeAtIndex:0];
        if (font) {
            [self addAttribute:NSFontAttributeName
                                      value:font range:resultRange];
        }
        if (color) {
            [self addAttribute:NSForegroundColorAttributeName value:color range:resultRange];
        }
    }];
    return self;
}

- (NSMutableAttributedString *)changeUnderLineWithChangeString:(NSString *)changeStr
                                                      isSingle:(BOOL)isSingle
                                                   totalString:(NSString *)totalString {
    //改变字符是否要下划线
    
    NSUnderlineStyle stryle = 0; // 浅或厚的下滑线
    if (isSingle) {
        stryle = NSUnderlineStyleSingle;
    } else {
        stryle = NSUnderlineStyleThick;
    }
    [self addAttribute:NSUnderlineStyleAttributeName value:@(stryle) range:[totalString rangeOfString:changeStr]];
    
    return self;
}


- (NSMutableAttributedString *)changeDeleteLineWithChangeString:(NSString *)changeStr
                                                      lineColor:(UIColor *)lineColor
                                                    totalString:(NSString *)totalString {
    //改变字符的删除线
    
    [self addAttribute:NSStrikethroughStyleAttributeName value:@(NSUnderlinePatternSolid | NSUnderlineStyleSingle) range:[totalString rangeOfString:changeStr]];//删除线
    if (lineColor) {
        [self addAttribute:NSStrikethroughColorAttributeName value:lineColor range:[totalString rangeOfString:changeStr]];//删除线颜色
    }
    return self;
}

- (NSMutableAttributedString *)changeHollowWordsWithChangeString:(NSString *)changeStr
                                                       wordColor:(UIColor *)wordColor
                                                     totalString:(NSString *)totalString {
    //改变字符是否为空心字
    
    [self addAttribute:NSStrokeColorAttributeName value:wordColor range:[totalString rangeOfString:changeStr]];//设置文字描边颜色，需要和NSStrokeWidthAttributeName设置描边宽度，这样就能使文字空心
    [self addAttribute:NSStrokeWidthAttributeName value:@2 range:[totalString rangeOfString:changeStr]];//空心字，文字边框描述
    
    return self;
}

- (CGFloat)getLabelHeightWithMaxWidth:(CGFloat)maxWidth {
    
    CGSize size = [self boundingRectWithSize:CGSizeMake(maxWidth, 0) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading context:nil].size;
    return size.height;
}

@end
