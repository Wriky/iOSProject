//
//  NSMutableAttributedString+AddAttribute.h
//  ASAttributedString
//
//  Created by 廖伟魏 on 16/9/2.
//  Copyright © 2016年 廖伟魏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreText/CoreText.h>
#import <UIKit/UIKit.h>

@interface NSMutableAttributedString (AddAttribute)


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
                                        totalString:(NSString *)totalString
                                     subStringArray:(NSArray *)subArray;

/**
 *  需求：需要更改字间距来适应整体UI
 *
 *  单纯改变句子的字间距（需要 <coretext coretext.h="">）
 *
 *  @param totalString 需要更改的字符串
 *  @param space       字间距
 *
 *  @return 生成的富文本
 */
- (NSMutableAttributedString *)changeSpaceWithTotalString:(NSString *)totalString
                                                    space:(CGFloat)space;

/**
 *  需求：需要改变行间距来适应整体UI
 *
 *  单纯改变段落的行间距
 *
 *  @param totalString 需要更改的字符串
 *  @param lineSpace   行间距
 *
 *  @return 生成的富文本
 */

- (NSMutableAttributedString *)changeLineSpaceWithTotalString:(NSString *)totalString
                                                    lineSpace:(CGFloat)lineSpace;


/**
 *  需求：同时更改行间距和字间距
 *
 *  同时更改行间距和字间距
 *
 *  @param totalString 需要改变的字符串
 *  @param lineSpace   行间距
 *  @param textSpace   字间距
 *
 *  @return 生成的富文本
 */

- (NSMutableAttributedString *)changeLineAndTextSpaceWithTotalString:(NSString *)totalString
                                                           lineSpace:(CGFloat)lineSpace
                                                           textSpace:(CGFloat)textSpace;

/**
 *  需求：更改某些文字的颜色并修改其字体，突出重点强调
 *
 *  改变某些文字的颜色 并单独设置其字体
 *
 *  @param font        设置的字体
 *  @param color       颜色
 *  @param totalString 总的字符串
 *  @param subArray    想要变色的字符数组
 *
 *  @return 生成的富文本
 */

- (NSMutableAttributedString *)changeFontAndColor:(UIFont *)font
                                            color:(UIColor *)color
                                      totalString:(NSString *)totalString
                                   subStringArray:(NSArray *)subArray;


/**
 *  需求：更改某些以特殊字符作为标识的文字的颜色和字体，突出范围强调
 *
 *  改变以特殊字符为标识之间的字符串的颜色或字体
 *
 *  @param startCharacter 开始要改变的字符(包含开始字符)
 *  @param endCharacter   改变截止的字符(包含结束字符)
 *  @param font           设置的字体
 *  @param color          颜色
 *  @param totalString    总的字符串
 *
 *  @return 生成的富文本
 */
- (NSMutableAttributedString *)changeCharacterFontAndColerFromStartCharacter:(NSString *)startCharacter

                                                                endCharacter:(NSString *)endCharacter
                                                                        font:(UIFont *)font
                                                                       color:(UIColor *)color
                                                                 totalString:(NSString *)totalString;


/**
 *  需求：更改数字的字体和颜色，突出数字
 *
 *  改变字符串中数字的颜色和字体
 *
 *  @param font        设置的字体
 *  @param color       颜色
 *  @param totalString 总的字符串
 *
 *  @return 生成的富文本
 */
- (NSMutableAttributedString *)changeNumberFontAndColorWithFont:(UIFont *)font
                                                          color:(UIColor *)color
                                                    totalString:(NSString *)totalString;

/**
 *  改变字符是否要下划线
 *
 *  @param changeStr   要加下划线的字符串
 *  @param isSingle    Bool->yes为浅下划线 no->为厚下划线
 *  @param totalString 总的字符串
 *
 *  @return 生成的富文本
 */
- (NSMutableAttributedString *)changeUnderLineWithChangeString:(NSString *)changeStr
                                                      isSingle:(BOOL)isSingle
                                                   totalString:(NSString *)totalString;


/**
 *  改变字符的删除线
 *
 *  @param changeStr   要加删除线的字符串
 *  @param lineColor   删除线的颜色 不设置就为nil
 *  @param totalString 总的字符串
 *
 *  @return 生成的富文本
 */
- (NSMutableAttributedString *)changeDeleteLineWithChangeString:(NSString *)changeStr
                                                      lineColor:(UIColor *)lineColor
                                                    totalString:(NSString *)totalString;

/**
 *  改变字符是否为空心字
 *
 *  @param changeStr   要变为空心字的字符串
 *  @param totalString 总的字符串
 *
 *  @return 生成的富文本
 */
- (NSMutableAttributedString *)changeHollowWordsWithChangeString:(NSString *)changeStr
                                                       wordColor:(UIColor *)wordColor
                                                     totalString:(NSString *)totalString;





@end
