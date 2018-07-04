//
//  NSString+Addtions.m
//  xxg
//
//  Created by chenweiqiang on 2017/6/13.
//  Copyright © 2017年 AS. All rights reserved.
//

#import "NSString+Addtions.h"
#import "WYCheckout.h"
#import "WYConfiguration.h"
#import "UIFont+Additions.h"

#import <CoreText/CoreText.h>


@implementation NSString (Addtions)

- (NSString *)secretIDCard {
    if ([self isKindOfClass:[NSString class]]) {
        if (self.length > 2) {
            NSString *idCard = [self copy];
            NSString *replaceStr = @"";
            for (NSInteger i=0; i<self.length-2; i++) {
               replaceStr = [replaceStr stringByAppendingString:@"*"];
            }
            
            idCard = [idCard stringByReplacingCharactersInRange:NSMakeRange(1, self.length-2) withString:replaceStr];
            return idCard;
        } else {
            return self;
        }
    }
    
    return @"";
}

- (NSString *)secretPhone {
    if ([self isKindOfClass:[NSString class]]) {
        if (self.length == 11 &&
            [WYCheckout isPhone:self]) {
            NSString *phone = [self copy];
            phone = [phone stringByReplacingCharactersInRange:NSMakeRange(3, 4) withString:@"****"];
            
            return phone;
        }
    }
    
    return @"";
}

- (NSString *)secretOtherCard {
    if ([self isKindOfClass:[NSString class]]) {
        if (self.length <= 2) {
            
            return self;
        } else {
            NSString *targetCard = [self copy];
            
            targetCard = [targetCard stringByReplacingCharactersInRange:NSMakeRange(1, targetCard.length-2) withString:@"************"];
            return targetCard;
        }
    }
    
    return @"";
}

- (NSArray *)componetsSeparateStr {
    if ([self isKindOfClass:[NSString class]]) {
        if ([self containsString:@" "]) {
            return [self componentsSeparatedByString:@" "];
        } else if ([self containsString:@","]) {
            return [self componentsSeparatedByString:@","];

        } else if ([self containsString:@"，"]) {
            return [self componentsSeparatedByString:@"，"];
        }
        
        return @[self];
    }
    
    return nil;
}


#pragma mark- ====================attribuateString==================

- (NSAttributedString *)stringToAttributeWithDefaultColor {
    
    return [self stringToAttribuateFontColor:[UIColor blackColor]];
}

- (NSAttributedString *)stringToAttribuateFontColor:(UIColor *)color {
    NSAttributedString *attrStr = [[NSAttributedString alloc] initWithString:self attributes:@{NSForegroundColorAttributeName: color}];
    
    return attrStr;
}


#pragma mark- timestring

- (NSString *)utcToYearMonthDay {
    if (self == nil) {
        return nil;
    }
    
    NSString *targetString = [self copy];
    targetString = [targetString stringByReplacingOccurrencesOfString:@"UTC" withString:@""];
    targetString = [targetString stringByReplacingOccurrencesOfString:@"CST" withString:@""];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //输入格式
    if ([self containsString:@"T"]) {
        if ([self containsString:@"."]) {
            [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSZ"];
            
        } else {
            [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZ"];
        }
        
    } else {
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss.SSZ"];
    }
    
    NSTimeZone *timeZone = [NSTimeZone localTimeZone];
    [dateFormatter setTimeZone:timeZone];
    
    
    NSDate *utcDate = [dateFormatter dateFromString:targetString];    //输出格式
    [dateFormatter setDateFormat:@"yyyy年MM月dd日"];
    NSString *dateString = [dateFormatter stringFromDate:utcDate];
    
    return dateString;
}

- (NSString *)utcToTimeString {
    
    if (self == nil) {
        return nil;
    }
    
    NSString *targetString = [self copy];
    targetString = [targetString stringByReplacingOccurrencesOfString:@"UTC" withString:@""];
    targetString = [targetString stringByReplacingOccurrencesOfString:@"CST" withString:@""];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //输入格式
    if ([self containsString:@"T"]) {
        if ([self containsString:@"."]) {
            [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSZ"];
            
        } else {
            [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZ"];
        }
        
    } else {
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss.SSZ"];
    }
    
    NSTimeZone *timeZone = [NSTimeZone localTimeZone];
    [dateFormatter setTimeZone:timeZone];
    
    
    NSDate *utcDate = [dateFormatter dateFromString:targetString];    //输出格式
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *dateString = [dateFormatter stringFromDate:utcDate];
    
    return dateString;
}

- (NSString *)utcToDayChineseString {
    
    if (self == nil) {
        return nil;
    }
    
    NSString *targetString = [self copy];
    targetString = [targetString stringByReplacingOccurrencesOfString:@"UTC" withString:@""];
    targetString = [targetString stringByReplacingOccurrencesOfString:@"CST" withString:@""];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //输入格式
    if ([self containsString:@"T"]) {
        if ([self containsString:@"."]) {
            [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSZ"];
            
        } else {
            [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZ"];
        }
        
    } else {
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss.SSZ"];
    }
    
    NSTimeZone *timeZone = [NSTimeZone localTimeZone];
    [dateFormatter setTimeZone:timeZone];
    
    
    NSDate *utcDate = [dateFormatter dateFromString:targetString];    //输出格式
    [dateFormatter setDateFormat:@"yyyy年MM月dd日"];
    NSString *dateString = [dateFormatter stringFromDate:utcDate];
    
    return dateString;
}

- (NSString *)utcToDayNoYearChineseString {
    
    if (self == nil) {
        return nil;
    }
    
    NSString *targetString = [self copy];
    targetString = [targetString stringByReplacingOccurrencesOfString:@"UTC" withString:@""];
    targetString = [targetString stringByReplacingOccurrencesOfString:@"CST" withString:@""];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //输入格式
    if ([self containsString:@"T"]) {
        if ([self containsString:@"."]) {
            [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSZ"];
            
        } else {
            [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZ"];
        }
        
    } else {
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss.SSZ"];
    }
    
    NSTimeZone *timeZone = [NSTimeZone localTimeZone];
    [dateFormatter setTimeZone:timeZone];
    
    
    NSDate *utcDate = [dateFormatter dateFromString:targetString];    //输出格式
    [dateFormatter setDateFormat:@"MM月dd日"];
    NSString *dateString = [dateFormatter stringFromDate:utcDate];
    
    return dateString;
}

- (NSString *)sendTimeLineTimeStr {

    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    
    NSDate *createDate = [self utcToLocationDate];
    NSDate *nowDate = [NSDate date];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute;
    
    NSDateComponents *spaceComponent = [calendar components:unitFlags fromDate:createDate toDate:nowDate options:NSCalendarMatchStrictly];
    
    NSDateComponents *createComponent = [calendar components:unitFlags fromDate:createDate];
    NSDateComponents *nowComponent = [calendar components:unitFlags fromDate:nowDate];
    
    NSInteger spaceDay = nowComponent.day-createComponent.day;
    if (createComponent.year == nowComponent.year) {//今年&&当月
        if (spaceDay == 1) {
            fmt.dateFormat = @"昨天 HH:mm";
            return [fmt stringFromDate:createDate];
        } else if (spaceDay == 0) { //今天
            if(spaceComponent.hour > 1) {
                return [NSString stringWithFormat:@"%ld小时前",(long)spaceComponent.hour];
            } else if(spaceComponent.minute >= 1) {
                return [NSString stringWithFormat:@"%ld分钟前",(long)spaceComponent.minute];
            } else {
                return @"刚刚";
            }
        } else{
            fmt.dateFormat = @"MM-dd HH:mm";
            return [fmt stringFromDate:createDate];
        }
    } else {
        fmt.dateFormat = @"yyyy-MM-dd HH:mm";

        return [fmt stringFromDate:createDate];
    }
}

- (NSString *)finishDayHourMinTimeCutDown {
    
    NSDate *createDate = [self utcToLocationDate];
    long long time = [createDate timeIntervalSinceNow];
    if (time <= 0) {
        return @"0分";
    }
    
    NSInteger pre_min = 60;
    NSInteger pre_hour = 60*60;
    NSInteger pre_day = 24*pre_hour;
    
    NSInteger day = time/pre_day;
    NSInteger hour = (time%pre_day)/pre_hour;
    NSInteger min = ((time%pre_day)%pre_hour)/pre_min;
    NSString *dayStr = @"";
    NSString *hourStr = @"";
    NSString *minStr = @"";

    if (day > 0) {
        dayStr = [NSString stringWithFormat:@"%zd天",day];
    }
    
    if (hour > 0) {
        hourStr = [NSString stringWithFormat:@"%zd时",hour];
    }
    
    if (minStr > 0) {
        minStr = [NSString stringWithFormat:@"%zd分",min];
    }
    
    return [NSString stringWithFormat:@"%@%@%@",dayStr,hourStr,minStr];
}

+ (NSAttributedString *)getNoMoreDataAttributeStr {
    NSString *endStr = @"/ end /";
    NSMutableAttributedString *attributeStr = [[NSMutableAttributedString alloc] initWithString:endStr];
    [attributeStr addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, 1)];
    [attributeStr addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(endStr.length-1, 1)];
    [attributeStr addAttribute:NSFontAttributeName value:[UIFont CFRegular:12] range:NSMakeRange(0, 1)];
    [attributeStr addAttribute:NSFontAttributeName value:[UIFont CFRegular:12] range:NSMakeRange(endStr.length-1, 1)];
    return [attributeStr mutableCopy];
}

- (NSString *)finishDayCutDown {
    
    NSDate *createDate = [self utcToLocationDate];
    long long time = [createDate timeIntervalSinceNow];
    if (time <= 0) {
        return @"";
    }
    
    NSInteger pre_hour = 60*60;
    NSInteger pre_day = 24*pre_hour;
    
    NSInteger day = time/pre_day;
    NSString *dayStr = @"";
    
    if (day > 0) {
        dayStr = [NSString stringWithFormat:@"%zd天",day];
    }
    
    return dayStr;
}

- (NSString *)finishHourMinTimeCutDown {
    
    NSDate *createDate = [self utcToLocationDate];
    long long time = [createDate timeIntervalSinceNow];
    if (time <= 0) {
        return @"";
    }
    
    NSInteger pre_min = 60;
    NSInteger pre_hour = 60*60;
    NSInteger pre_day = 24*pre_hour;
    
    NSInteger hour = (time%pre_day)/pre_hour;
    NSInteger min = ((time%pre_day)%pre_hour)/pre_min;
    NSString *hourStr = @"";
    NSString *minStr = @"";

    
    if (hour > 0) {
        hourStr = [NSString stringWithFormat:@"%zd",hour];
        if (hourStr.length < 2) {
            hourStr = [NSString stringWithFormat:@"0%zd",hour];
        }
    } else {
        hourStr = @"00";
    }
    
    if (minStr > 0) {
        minStr = [NSString stringWithFormat:@"%zd",min];
        if (minStr.length < 2) {
            minStr = [NSString stringWithFormat:@"0%zd",min];
        }
    } else {
        minStr = @"00";
    }
    
    return [NSString stringWithFormat:@"%@:%@",hourStr,minStr];
}

- (NSString *)utcToDayNormalString {
    
    if (self == nil) {
        return nil;
    }
    
    NSString *targetString = [self copy];
    targetString = [targetString stringByReplacingOccurrencesOfString:@"UTC" withString:@""];
    targetString = [targetString stringByReplacingOccurrencesOfString:@"CST" withString:@""];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //输入格式
    if ([self containsString:@"T"]) {
        if ([self containsString:@"."]) {
            [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSZ"];
            
        } else {
            [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZ"];
        }
        
    } else {
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss.SSZ"];
    }
    
    NSTimeZone *timeZone = [NSTimeZone localTimeZone];
    [dateFormatter setTimeZone:timeZone];
    
    
    NSDate *utcDate = [dateFormatter dateFromString:targetString];    //输出格式
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *dateString = [dateFormatter stringFromDate:utcDate];
    
    return dateString;
}

#pragma mark- nsdate

- (NSDate *)utcToLocationDate {
    
    if (self == nil) {
        return nil;
    }
    
    NSString *targetString = [self copy];
    targetString = [targetString stringByReplacingOccurrencesOfString:@"UTC" withString:@""];
    targetString = [targetString stringByReplacingOccurrencesOfString:@"CST" withString:@""];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //输入格式
    if ([self containsString:@"T"]) {
        if ([self containsString:@"."]) {
            [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSZ"];
            
        } else {
            [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZ"];
        }
        
    } else {
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss.SSZ"];
    }
    
    NSTimeZone *timeZone = [NSTimeZone localTimeZone];
    [dateFormatter setTimeZone:timeZone];
    
    
    NSDate *utcDate = [dateFormatter dateFromString:targetString];    //输出格式
    
    
    return utcDate;
}

- (NSString *)utcToMonthShortAndDayString {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];

    NSDate *targetDate = [self utcToLocationDate];
    
    [dateFormatter setDateFormat:@"MMM.d"];
    NSString *dateString = [dateFormatter stringFromDate:targetDate];
    
    return dateString;
}

- (NSString *)utcTimeStringCompareCurrentTimeByDay {
    NSDate *targetDate = [self utcToLocationDate];
    NSTimeInterval timeInterval = [targetDate timeIntervalSinceNow];    
    if (timeInterval <= 0) {
       return @"0天";
    }
    long temp = timeInterval;
    NSInteger preTime = 24*60*60;
    NSString *result = [NSString stringWithFormat:@"%zd天",temp/preTime];
    
    return result;
}

- (NSString *)videoDurtion {
    NSInteger duration = [self integerValue];
    
    NSInteger min = duration/60;
    NSInteger seconds = duration%60;
    NSString *resultStr = nil;

    if (min < 10) {
        resultStr = [NSString stringWithFormat:@"0%zd:",min];
    } else {
        resultStr = [NSString stringWithFormat:@"%zd:",min];
    }
    if (seconds >= 10) {
        resultStr = [NSString stringWithFormat:@"%@%zd",resultStr,seconds];
    } else {
        resultStr = [NSString stringWithFormat:@"%@0%zd",resultStr,seconds];

    }
    
    return resultStr;
}

#pragma mark- 改变字体 attributeString
- (NSMutableAttributedString *)changeCharacterFontAndColerFromStartCharacter:(NSString *)startCharacter endCharacter:(NSString *)endCharacter color:(UIColor *)color {
    //改变以特殊字符为标识之间的字符串的颜色或字体
    NSMutableAttributedString *attributeStr = [[NSMutableAttributedString alloc] initWithString:self];
    
    //开始字符和结束字符同时存在
    if (endCharacter && startCharacter) {
        NSRange startRange = [self rangeOfString:startCharacter];
        NSRange endRange = [self rangeOfString:endCharacter options:NSBackwardsSearch];
        if (startRange.location != NSNotFound && endRange.location != NSNotFound) {
            if (color) {
                [attributeStr addAttribute:NSForegroundColorAttributeName value:color range:NSMakeRange(startRange.location, endRange.location - startRange.location+1)];
            }
        } else {
            NSLog(@"------没有找到开始或结束字符------");
        }
        
    } else {
        //搜索开始字符
        if (startCharacter) {
            NSRange startRange = [self rangeOfString:startCharacter];
            if (startRange.location == NSNotFound) {
                NSLog(@"------没有找到开始字符：%@------",startCharacter);
            } else {
                if (color) {
                    [attributeStr addAttribute:NSForegroundColorAttributeName value:color range:NSMakeRange(startRange.location, self.length-startRange.location)];
                }
            }
        }
        //搜索结束字符 从末尾开始查找
        if (endCharacter) {
            NSRange endRange = [self rangeOfString:endCharacter options:NSBackwardsSearch];
            if (endRange.location == NSNotFound) {
                NSLog(@"------没有找到结束字符：%@------",endCharacter);
            } else {
                if (color) {
                    [attributeStr addAttribute:NSForegroundColorAttributeName value:color range:NSMakeRange(0, endRange.location+1)];
                }
            }
        }
    }
    
    return attributeStr;
}


- (NSMutableAttributedString *)changeColorWithColor:(UIColor *)color  subStringArray:(NSArray *)subArray {
    //单纯改变一句话中的某些字的颜色
    NSMutableAttributedString *attributeStr = [[NSMutableAttributedString alloc] initWithString:self];
    
    if (subArray.count > 0) {
        for (NSString *rangeString in subArray) {
            NSRange range = [self rangeOfString:rangeString options:NSBackwardsSearch];
            [attributeStr addAttribute:NSForegroundColorAttributeName value:color range:range];
        }
    }
    return attributeStr;
}

- (NSMutableAttributedString *)changeSpaceWithSpace:(CGFloat)space {
    //单纯改变句子的字间距
    NSMutableAttributedString *attributeStr = [[NSMutableAttributedString alloc] initWithString:self];
    
    long number = space;
    CFNumberRef num = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt8Type, &number);
    [attributeStr addAttribute:(id)kCTKernAttributeName value:(__bridge id)num range:NSMakeRange(0, [attributeStr length])];
    CFRelease(num);
    return attributeStr;
}

- (NSMutableAttributedString *)changeLineSpaceWithLineSpace:(CGFloat)lineSpace {
    //单纯改变行间距
    NSMutableAttributedString *attributeStr = [[NSMutableAttributedString alloc] initWithString:self];
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpace];
    [attributeStr addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [self length])];
    return attributeStr;
}

- (NSMutableAttributedString *)changeLineAndTextSpaceWithLineSpace:(CGFloat)lineSpace textSpace:(CGFloat)textSpace {
    //同时更改行间距和字间距
    NSMutableAttributedString *attributeStr = [[NSMutableAttributedString alloc] initWithString:self];
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpace];
    [attributeStr addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [self length])];
    
    long number = textSpace;
    CFNumberRef num = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt8Type, &number);
    [attributeStr addAttribute:(id)kCTKernAttributeName value:(__bridge id)num range:NSMakeRange(0, [attributeStr length])];
    CFRelease(num);
    return attributeStr;
}


- (NSMutableAttributedString *)changeFontAndColor:(UIFont *)font
                                            color:(UIColor *)color
                                   subStringArray:(NSArray *)subArray {
    //改变某些文字的颜色 并单独设置其字体
    NSMutableAttributedString *attributeStr = [[NSMutableAttributedString alloc] initWithString:self];
    
    if (subArray.count > 0) {
        for (NSString *rangeStr in subArray) {
            NSRange range = [self rangeOfString:rangeStr options:NSLiteralSearch];
            [attributeStr addAttribute:NSForegroundColorAttributeName value:color range:range];
            [attributeStr addAttribute:NSFontAttributeName value:font range:range];
        }
    }
    return attributeStr;
}

- (NSMutableAttributedString *)changeRange:(NSRange)range color:(UIColor *)color {
    NSMutableAttributedString *attributeStr = [[NSMutableAttributedString alloc] initWithString:self];
    [attributeStr addAttribute:NSForegroundColorAttributeName value:color range:range];
    return attributeStr;
}



- (NSMutableAttributedString *)changeCharacterFontAndColerFromStartCharacter:(NSString *)startCharacter endCharacter:(NSString *)endCharacter font:(UIFont *)font color:(UIColor *)color {
    //改变以特殊字符为标识之间的字符串的颜色或字体
    NSMutableAttributedString *attributeStr = [[NSMutableAttributedString alloc] initWithString:self];
    
    //开始字符和结束字符同时存在
    if (endCharacter && startCharacter) {
        NSRange startRange = [self rangeOfString:startCharacter];
        NSRange endRange = [self rangeOfString:endCharacter options:NSBackwardsSearch];
        if (startRange.location != NSNotFound && endRange.location != NSNotFound) {
            if (color) {
                [attributeStr addAttribute:NSForegroundColorAttributeName value:color range:NSMakeRange(startRange.location, endRange.location - startRange.location+1)];
            }
            if (font) {
                [attributeStr addAttribute:NSFontAttributeName value:font range:NSMakeRange(startRange.location, endRange.location - startRange.location+1)];
            }
        } else {
            NSLog(@"------没有找到开始或结束字符------");
        }
        
    } else {
        //搜索开始字符
        if (startCharacter) {
            NSRange startRange = [self rangeOfString:startCharacter];
            if (startRange.location == NSNotFound) {
                NSLog(@"------没有找到开始字符：%@------",startCharacter);
            } else {
                if (color) {
                    [attributeStr addAttribute:NSForegroundColorAttributeName value:color range:NSMakeRange(startRange.location, self.length-startRange.location)];
                }
                if (font) {
                    [attributeStr addAttribute:NSFontAttributeName value:font range:NSMakeRange(startRange.location, self.length-startRange.location)];
                }
            }
        }
        //搜索结束字符 从末尾开始查找
        if (endCharacter) {
            NSRange endRange = [self rangeOfString:endCharacter options:NSBackwardsSearch];
            if (endRange.location == NSNotFound) {
                NSLog(@"------没有找到结束字符：%@------",endCharacter);
            } else {
                if (color) {
                    [attributeStr addAttribute:NSForegroundColorAttributeName value:color range:NSMakeRange(0, endRange.location+1)];
                }
                if (font) {
                    [attributeStr addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, endRange.location+1)];
                }
            }
        }
    }
    
    return attributeStr;
}

- (NSMutableAttributedString *)changeNumberFontAndColorWithFont:(UIFont *)font
                                                          color:(UIColor *)color {
    //改变字符串中数字的颜色和字体
    NSMutableAttributedString *attributeStr = [[NSMutableAttributedString alloc] initWithString:self];
    
    NSString *regexString = @"[0-9]{1,}";
    //数字正则匹配
    NSRegularExpression *regex = [NSRegularExpression
                                  regularExpressionWithPattern:regexString
                                  options:NSRegularExpressionAnchorsMatchLines
                                  error:nil];
    
    [regex enumerateMatchesInString:self options:0 range:NSMakeRange(0, self.length) usingBlock:^(NSTextCheckingResult *result, NSMatchingFlags flags, BOOL *stop) {
        
        NSRange resultRange = [result rangeAtIndex:0];
        if (font) {
            [attributeStr addAttribute:NSFontAttributeName
                                 value:font range:resultRange];
        }
        if (color) {
            [attributeStr addAttribute:NSForegroundColorAttributeName value:color range:resultRange];
        }
    }];
    return attributeStr;
}

- (NSMutableAttributedString *)changeUnderLineWithChangeString:(NSString *)changeStr
                                                      isSingle:(BOOL)isSingle {
    //改变字符是否要下划线
    
    NSMutableAttributedString *attributeStr = [[NSMutableAttributedString alloc] initWithString:self];
    
    NSUnderlineStyle stryle = 0; // 浅或厚的下滑线
    if (isSingle) {
        stryle = NSUnderlineStyleSingle;
    } else {
        stryle = NSUnderlineStyleThick;
    }
    [attributeStr addAttribute:NSUnderlineStyleAttributeName value:@(stryle) range:[self rangeOfString:changeStr]];
    
    return attributeStr;
}


- (NSMutableAttributedString *)changeDeleteLineWithChangeString:(NSString *)changeStr
                                                      lineColor:(UIColor *)lineColor {
    //改变字符的删除线
    NSMutableAttributedString *attributeStr = [[NSMutableAttributedString alloc] initWithString:self];
    
    [attributeStr addAttribute:NSStrikethroughStyleAttributeName value:@(NSUnderlinePatternSolid | NSUnderlineStyleSingle) range:[self rangeOfString:changeStr]];//删除线
    if (lineColor) {
        [attributeStr addAttribute:NSStrikethroughColorAttributeName value:lineColor range:[self rangeOfString:changeStr]];//删除线颜色
    }
    return attributeStr;
}

- (NSMutableAttributedString *)changeHollowWordsWithChangeString:(NSString *)changeStr
                                                       wordColor:(UIColor *)wordColor {
    //改变字符是否为空心字
    NSMutableAttributedString *attributeStr = [[NSMutableAttributedString alloc] initWithString:self];
    
    [attributeStr addAttribute:NSStrokeColorAttributeName value:wordColor range:[self rangeOfString:changeStr]];//设置文字描边颜色，需要和NSStrokeWidthAttributeName设置描边宽度，这样就能使文字空心
    [attributeStr addAttribute:NSStrokeWidthAttributeName value:@2 range:[self rangeOfString:changeStr]];//空心字，文字边框描述
    
    return attributeStr;
}

#pragma mark- 获取文字高度


- (CGFloat)getHeightNormalSpaceLabelWithFont:(UIFont *)font
                                    maxWidth:(CGFloat)maxWidth {
    if (font == nil) {
        font = [UIFont systemFontOfSize:17];
    }
    NSDictionary *dic = @{NSFontAttributeName:font};
    CGSize size = [self boundingRectWithSize:CGSizeMake(maxWidth, 0) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading  attributes:dic context:nil].size;
    return ceil(size.height);
}

- (CGFloat)getHeightChangeLineLabelWithFont:(UIFont*)font
                                  lineSpace:(CGFloat)lineSpace
                                   maxWidth:(CGFloat)maxWidth {
    if (font == nil) {
        font = [UIFont systemFontOfSize:17];
    }
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.lineBreakMode = NSLineBreakByCharWrapping;
    paraStyle.alignment = NSTextAlignmentLeft;
    paraStyle.lineSpacing = lineSpace;
    
    NSDictionary * dic = @{NSFontAttributeName:font,
                           
                           NSParagraphStyleAttributeName:paraStyle
                           
                           };
    
    CGSize size = [self boundingRectWithSize:CGSizeMake(maxWidth, 0) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
    
    return ceil(size.height);
}

- (CGFloat)getTargetStrWidthWithFont:(UIFont*)font {
    if (font == nil) {
        font = [UIFont systemFontOfSize:17];
    }
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.lineBreakMode = NSLineBreakByCharWrapping;
    paraStyle.alignment = NSTextAlignmentLeft;
    
    NSDictionary * dic = @{NSFontAttributeName:font,
                           
                           NSParagraphStyleAttributeName:paraStyle
                           
                           };
    
    CGSize size = [self boundingRectWithSize:CGSizeMake(100, 0) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
    
    return ceil(size.width);
}

- (CGFloat)getHeightAllSpaceLabelWithFont:(UIFont*)font
                                lineSpace:(CGFloat)lineSpace
                          textlengthSpace:(CGFloat)textlengthSpace
                         paragraphSpacing:(CGFloat)paragraphSpacing
                                 maxWidth:(CGFloat)maxWidth {
    
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.lineBreakMode = NSLineBreakByCharWrapping;
    paraStyle.alignment = NSTextAlignmentLeft;
    if (lineSpace > 0) {
        paraStyle.lineSpacing = lineSpace;
    }
    paraStyle.paragraphSpacing = paragraphSpacing;
    paraStyle.hyphenationFactor = 1.0;
    paraStyle.firstLineHeadIndent = 0.0;
    paraStyle.paragraphSpacingBefore = 0.0;
    paraStyle.headIndent = 0;
    paraStyle.tailIndent = 0;
    if (font == nil) {
        font = [UIFont systemFontOfSize:17];
    }
    NSDictionary *dic = @{NSFontAttributeName:font,
                          
                          NSParagraphStyleAttributeName:paraStyle,
                          
                          NSKernAttributeName:[NSNumber numberWithFloat:textlengthSpace]
                          
                          };
    
    CGSize size = [self boundingRectWithSize:CGSizeMake(maxWidth, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
    
    return ceil(size.height);
    
}

#pragma mark- string handle

- (NSString *)addSeperateChar {
    if (![self isKindOfClass:[NSString class]]) {
        return nil;
    }
    NSString *targetStr = [self stringByReplacingOccurrencesOfString:@" " withString:@""];
    if (targetStr.length <= 0) {
        return @"";
    }
    NSString *resultStr = @"";
    for (int i = 0; i < targetStr.length; i++) {
        char tempStr = [targetStr characterAtIndex:i];

        if ([resultStr isEqualToString:@""]) {
            resultStr = [NSString stringWithFormat:@"%c",tempStr];
        } else {
            resultStr = [NSString stringWithFormat:@"%@-%c",resultStr,tempStr];
        }
    }
    
    return resultStr;
}



#pragma mark- time cut down

- (NSTimeInterval)timeInervalWithCurrentTime {
    if (self == nil || self.length <= 0) {
        return 0;
    }
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *targetDate = [dateFormatter dateFromString:self];
    
    NSDate *date = [NSDate date];
    
    
    return [date timeIntervalSinceDate:targetDate];
    
}

#pragma mark- byte

- (int)getBytesCount {
    int strlength = 0;
    char* p = (char*)[self cStringUsingEncoding:NSUnicodeStringEncoding];
    for (int i=0 ; i<[self lengthOfBytesUsingEncoding:NSUnicodeStringEncoding] ;i++) {
        if (*p) {
            p++;
            strlength++;
        }
        else {
            p++;
        }
    }
    return strlength;
}

- (NSString *)subStringByByteWithIndex:(NSInteger)index {
    
    NSInteger sum = 0;
    
    NSString *subStr = [[NSString alloc] init];
    
    for(int i = 0; i<[self length]; i++){
        
        unichar strChar = [self characterAtIndex:i];
        
        if(strChar < 256){
            sum += 1;
        }
        else {
            sum += 2;
        }
        if (sum >= index) {
            
            subStr = [self substringToIndex:i+1];
            return subStr;
        }
        
    }
    
    return subStr;
}

//字宽

- (CGSize)sizeWithText:(UIFont*)font {
    NSDictionary *attrs = @{NSFontAttributeName : font};
    return [self boundingRectWithSize:CGSizeMake(1000, 20) options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}

- (NSString *)subTextWithWidth:(NSString *)targetStr font:(UIFont *)font needEllipsis:(BOOL)ellipsis {
    NSString *result = [self copy];
    NSDictionary *attrs = @{NSFontAttributeName : font};
    NSString *oneWord = @"一";
    CGFloat targetWidth =[targetStr boundingRectWithSize:CGSizeMake(1000, 20) options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size.width;
     CGFloat oneWidth =[oneWord boundingRectWithSize:CGSizeMake(1000, 20) options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size.width;
    
    CGFloat resultWidth = [result boundingRectWithSize:CGSizeMake(1000, 20) options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size.width;
    if (resultWidth > targetWidth) {
        NSRange subRange = NSMakeRange(0,result.length- round((resultWidth-targetWidth)/oneWidth));
        result = [result substringWithRange:subRange];
        if (ellipsis) {
            result = [result stringByAppendingString:@"..."];
        }
    }
    
    return result;

}



@end
