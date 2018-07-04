//
//  NSString+Addtions.h
//  xxg
//
//  Created by chenweiqiang on 2017/6/13.
//  Copyright © 2017年 AS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface NSString (Addtions)

- (NSString *)secretIDCard;
- (NSString *)secretPhone;

- (NSString *)secretOtherCard;

- (NSArray *)componetsSeparateStr;

//placeholder
- (NSAttributedString *)stringToAttributeWithDefaultColor;

- (NSAttributedString *)stringToAttribuateFontColor:(UIColor *)color;

- (NSString *)utcToYearMonthDay;

- (NSString *)utcToTimeString;

- (NSString *)utcToDayChineseString;

- (NSString *)utcToDayNoYearChineseString;

- (NSString *)utcToDayNormalString;

- (NSDate *)utcToLocationDate;

- (NSString *)utcTimeStringCompareCurrentTimeByDay;

- (NSString *)sendTimeLineTimeStr;

- (NSString *)videoDurtion;

- (NSString *)finishDayHourMinTimeCutDown;

+ (NSAttributedString *)getNoMoreDataAttributeStr;

- (NSString *)utcToMonthShortAndDayString;
//attribute

- (NSMutableAttributedString *)changeCharacterFontAndColerFromStartCharacter:(NSString *)startCharacter endCharacter:(NSString *)endCharacter color:(UIColor *)color;

/**
 *
 *  单纯改变一句话中的某些字的颜色
 *
 *  @param color    需要改变成的颜色
 *  @param subArray 需要改变颜色的文字数组
 *
 *  @return 生成的富文本
 */
- (NSMutableAttributedString *)changeColorWithColor:(UIColor *)color
                                     subStringArray:(NSArray *)subArray;

/**
 *  需求：需要更改字间距来适应整体UI
 *
 *  单纯改变句子的字间距（需要 <coretext coretext.h="">）
 *
 *  @param space       字间距
 *
 *  @return 生成的富文本
 */
- (NSMutableAttributedString *)changeSpaceWithSpace:(CGFloat)space;

/**
 *  需求：需要改变行间距来适应整体UI
 *
 *  单纯改变段落的行间距
 *
 *  @param lineSpace   行间距
 *
 *  @return 生成的富文本
 */

- (NSMutableAttributedString *)changeLineSpaceWithLineSpace:(CGFloat)lineSpace;


/**
 *  需求：同时更改行间距和字间距
 *
 *  同时更改行间距和字间距
 *
 *  @param lineSpace   行间距
 *  @param textSpace   字间距
 *
 *  @return 生成的富文本
 */

- (NSMutableAttributedString *)changeLineAndTextSpaceWithLineSpace:(CGFloat)lineSpace
                                                         textSpace:(CGFloat)textSpace;

/**
 *  需求：更改某些文字的颜色并修改其字体，突出重点强调
 *
 *  改变某些文字的颜色 并单独设置其字体
 *
 *  @param font        设置的字体
 *  @param color       颜色
 *  @param subArray    想要变色的字符数组
 *
 *  @return 生成的富文本
 */

- (NSMutableAttributedString *)changeFontAndColor:(UIFont *)font
                                            color:(UIColor *)color
                                   subStringArray:(NSArray *)subArray;

- (NSMutableAttributedString *)changeRange:(NSRange)range
                                     color:(UIColor *)color;

/**
 *  需求：更改某些以特殊字符作为标识的文字的颜色和字体，突出范围强调
 *
 *  改变以特殊字符为标识之间的字符串的颜色或字体
 *
 *  @param startCharacter 开始要改变的字符(包含开始字符)
 *  @param endCharacter   改变截止的字符(包含结束字符)
 *  @param font           设置的字体
 *  @param color          颜色
 *
 *  @return 生成的富文本
 */
- (NSMutableAttributedString *)changeCharacterFontAndColerFromStartCharacter:(NSString *)startCharacter

                                                                endCharacter:(NSString *)endCharacter
                                                                        font:(UIFont *)font
                                                                       color:(UIColor *)color;


/**
 *  需求：更改数字的字体和颜色，突出数字
 *
 *  改变字符串中数字的颜色和字体
 *
 *  @param font        设置的字体
 *  @param color       颜色
 *
 *  @return 生成的富文本
 */
- (NSMutableAttributedString *)changeNumberFontAndColorWithFont:(UIFont *)font
                                                          color:(UIColor *)color;

/**
 *  改变字符是否要下划线
 *
 *  @param changeStr   要加下划线的字符串
 *  @param isSingle    Bool->yes为浅下划线 no->为厚下划线
 *
 *  @return 生成的富文本
 */
- (NSMutableAttributedString *)changeUnderLineWithChangeString:(NSString *)changeStr
                                                      isSingle:(BOOL)isSingle;


/**
 *  改变字符的删除线
 *
 *  @param changeStr   要加删除线的字符串
 *  @param lineColor   删除线的颜色 不设置就为nil
 *
 *  @return 生成的富文本
 */
- (NSMutableAttributedString *)changeDeleteLineWithChangeString:(NSString *)changeStr
                                                      lineColor:(UIColor *)lineColor;

/**
 *  改变字符是否为空心字
 *
 *  @param changeStr   要变为空心字的字符串
 *
 *  @return 生成的富文本
 */
- (NSMutableAttributedString *)changeHollowWordsWithChangeString:(NSString *)changeStr
                                                       wordColor:(UIColor *)wordColor;


/**
 *  得到正常没设置间距的文本高度
 *
 *  @param font     字符串的字体 正常字体用nil代替
 *  @param maxWidth 宽度
 *
 *  @return 文本的高度
 */
- (CGFloat)getHeightNormalSpaceLabelWithFont:(UIFont*)font
                                    maxWidth:(CGFloat)maxWidth;
/**
 *  得到设置有行距的文本高度
 *
 *  @param font      字符串的字体 正常字体用nil代替
 *  @param lineSpace 行间距
 *  @param maxWidth  宽度
 *
 *  @return 文本的高度
 */
- (CGFloat)getHeightChangeLineLabelWithFont:(UIFont*)font
                                  lineSpace:(CGFloat)lineSpace
                                   maxWidth:(CGFloat)maxWidth;

/**
 *  得到设置有全部间隔的文本高度
 *
 *  @param font             字符串的字体 正常字体用nil代替
 *  @param lineSpace        行间距
 *  @param maxWidth         宽度
 *  @param textlengthSpace  字间距
 *  @param paragraphSpacing 段间距
 *
 *  @return 文本的高度
 */
- (CGFloat)getHeightAllSpaceLabelWithFont:(UIFont*)font
                                lineSpace:(CGFloat)lineSpace
                          textlengthSpace:(CGFloat)textlengthSpace
                         paragraphSpacing:(CGFloat)paragraphSpacing
                                 maxWidth:(CGFloat)maxWidth;


- (NSString *)addSeperateChar;


- (NSTimeInterval)timeInervalWithCurrentTime;
- (NSString *)finishDayCutDown;
- (NSString *)finishHourMinTimeCutDown;

/**
 获取目标字符串宽度
 
 @param font 字体大小
 @return 字符宽度
 */
- (CGFloat)getTargetStrWidthWithFont:(UIFont*)font;

- (int)getBytesCount;

- (NSString *)subStringByByteWithIndex:(NSInteger)index;

//字宽
- (CGSize)sizeWithText:(UIFont*)font;

/**
 根据字宽截取字符串

 @param targetStr 标准宽度字符串
 @param font 标准字体大小
 @param ellipsis 是否需要省略号
 @return 截取后的字符串
 */
- (NSString *)subTextWithWidth:(NSString *)targetStr font:(UIFont *)font needEllipsis:(BOOL)ellipsis;
@end
