//
//  WYColorConfiguration.h
//  WYIOSProject
//
//  Created by wangyuan on 2018/1/26.
//  Copyright © 2018年 wangyuan. All rights reserved.
//

#ifndef  WYColorConfiguration_h
#define  WYColorConfiguration_h

#import <UIKit/UIKit.h>
#import "UIColor+Additions.h"

/*RGB Color*/
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r,g,b) RGBA(r,g,b,1.0f)
#define RGBSameA(r,a) [UIColor colorWithRed:r/255.0f green:r/255.0f blue:r/255.0f alpha:a]
#define RGBSame(r) RGBSameA(r,1.0f)


/*Hex Color*/
#define ColorWithHexString(name)   [UIColor colorWithHexString:name]

#define ColorWithHexStringAlpha(name, alpha)   [UIColor colorWithHexString:name withAlpha:alpha]



/*=======================================================*/

//Color
#define kColorNameIsD1D1D1     ColorWithHexString(@"#D1D1D1")
#define kColorNameIs575757     ColorWithHexString(@"#575757")
#define kColorNameIs898989     ColorWithHexString(@"#898989")
#define kColorNameIsD38863     ColorWithHexString(@"#D38863")
#define kColorNameIs26EE91     ColorWithHexString(@"#26EE91")
#define kColorNameIsF9F9F9     ColorWithHexString(@"#F9F9F9")
#define kColorNameIsA8A8A8     ColorWithHexString(@"#A8A8A8")



//Gray

#define kColorNameIs999999     ColorWithHexString(@"#999999")
#define kColorNameIs666666     ColorWithHexString(@"#666666")
#define kColorNameIs333333     ColorWithHexString(@"#333333")
#define kColorNameIs9B9B9B     ColorWithHexString(@"#9B9B9B")

#define kColorNameIs979797     ColorWithHexString(@"#979797")
#define kColorNameIs4A4A4A     ColorWithHexString(@"#4A4A4A")
#define kColorNameIsF5F5F5     ColorWithHexString(@"#F5F5F5")
#define kColorNameIsF9F9F9     ColorWithHexString(@"#F9F9F9")
#define kColorNameIsE8E8E8     ColorWithHexString(@"#E8E8E8")
#define kColorNameIsDCDCDC     ColorWithHexString(@"#DCDCDC")
#define kColorNameIsCDCDCD     ColorWithHexString(@"#CDCDCD")
#define kColorNameIsD1D1D1     ColorWithHexString(@"#D1D1D1")
#define kColorNameIsEFF1EF     ColorWithHexString(@"#EFF1EF")
#define kColorNameIsD9D9D9     ColorWithHexString(@"#D9D9D9")
#define kColorNameIsF4F4F4     ColorWithHexString(@"#F4F4F4")
#define kColorNameIsFAFAFA     ColorWithHexString(@"#FAFAFA")
#define kColorNameIs9E9E9E     ColorWithHexString(@"#9E9E9E")
#define kColorNameIsFFBD70     ColorWithHexString(@"#FFBD70")

#define kColorNameIsDCD8D8     ColorWithHexString(@"#DCD8D8")
#define kColorNameIsE2E3E6     ColorWithHexString(@"#E2E3E6")
#define kColorNameIsEFEFEF     ColorWithHexString(@"#EFEFEF")
#define kColorNameIsD8D8D8     ColorWithHexString(@"#D8D8D8")
#define kColorNameIs3B405E     ColorWithHexString(@"#3B405E")
#define kColorNameIs2F304E     ColorWithHexString(@"#2F304E")


//green
#define kColorNameIs6AFFA3     ColorWithHexString(@"#6AFFA3")


//Alpha Color
#define kAlphaColorNameIs7DB9A3   ColorWithHexStringAlpha(@"#7DB9A3", 0.54)
#define kAlphaColorNameIs6E6C6F   ColorWithHexStringAlpha(@"#6E6C6F", 0.5)



#endif /*  ColorConfiguration_h */
