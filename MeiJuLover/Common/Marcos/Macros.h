//
//  Macros.h
//  SAJControl
//
//  Created by user on 2017/8/1.
//  Copyright © 2017年 SAJDev. All rights reserved.
//

#ifndef Macros_h
#define Macros_h

#define WindowWidth      [UIScreen mainScreen].bounds.size.width

#define WindowHeight     [UIScreen mainScreen].bounds.size.height

#define RGB(R, G, B)     [UIColor colorWithRed:((R) / 255.0f) green:((G) / 255.0f) blue:((B) / 255.0f) alpha:1.0f]

#define MainColor RGB(58,163,112)

#define RGBACOLOR(r, g, b, a)   [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]

#define BottomBarHeight   (49.f)

//安全区域
#define kBottomSafeAreaH ((WindowHeight>=812) ||(WindowWidth >= 812) ? 34.0f : 0.0f)

#define kTopH ((WindowHeight>=812) ||(WindowWidth>=812) ? 88.0f :64.0f)

//十六进制颜色
#define RGBValue(rgbValue) [UIColor  colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0  green:((float)((rgbValue & 0xFF00) >> 8))/255.0  blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


// 定义通用颜色
#define kBlackColor         [UIColor blackColor]
#define kDarkGrayColor      [UIColor darkGrayColor]
#define kLightGrayColor     [UIColor lightGrayColor]
#define kWhiteColor         [UIColor whiteColor]
#define kGrayColor          [UIColor grayColor]
#define kRedColor           [UIColor redColor]
#define kGreenColor         [UIColor greenColor]
#define kBlueColor          [UIColor blueColor]
#define kCyanColor          [UIColor cyanColor]
#define kYellowColor        [UIColor yellowColor]
#define kMagentaColor       [UIColor magentaColor]
#define kOrangeColor        [UIColor orangeColor]
#define kPurpleColor        [UIColor purpleColor]
#define kClearColor         [UIColor clearColor]

#define LoginSucceed @"loginSuccess"

#define LogoutSucceed @"logoutSuccess"

#define LoginData  @"LoginData"

#define AuthorSumitSucceed @"authorSumitSucceed"

#define AddBankCardSucceed @"addBankCardSucceed"

#define RefreshComment @"refreshComment"

#define PasswordType @"passwordType"

#define VideoPlayer [VideoMgr shareInstance]

#define IsInterup  @"isInterup"

#define ShareClick @"shareClick"

#define UploadVideo @"uploadVideo"

#define ClearDiskFinish @"clearDisk"

#define ShowUpdateView @"showUpdateView"

#define HistorySearch @"historySearch"

#define LoginAccount @"loginAccount"

#define LaunchOptionsRemoteNotifi @"launchOptionsRemoteNotifi"

#define YSloginType @"ysloginType"

#define RefreshAttentionList @"RefreshAttentionList"

/// 取
#define AGUserDefaultsGET(key) [[NSUserDefaults standardUserDefaults] objectForKey:key]
/// 写
#define AGUserDefaultsSET(object,key) [[NSUserDefaults standardUserDefaults] setObject:object forKey:key]
/// 立即储存
#define AGUserDefaultsSynchronize [[NSUserDefaults standardUserDefaults] synchronize]
/// 删
#define AGUserDefaultsRemove(key) [[NSUserDefaults standardUserDefaults] removeObjectForKey:key]

#define BackToHomePage @"backtohomepage"

//tW切图w   VW限定的w 返回对应的h
#define MCAdaptiveH(TW,TH,VW) (((VW) *(TH)) / (TW))

#define MCAdaptiveW(TW,TH,VH) (((TW) *  (VH)) / (TH))


//仅用于字体
#define MC10  MCWidthScale*10
#define MC11  MCWidthScale*11
#define MC12  MCWidthScale*12
#define MC13  MCWidthScale*13
#define MC14  MCWidthScale*14
#define MC15  MCWidthScale*15
#define MC16  MCWidthScale*16
#define MC17  MCWidthScale*17
#define MC18  MCWidthScale*18
#define MC19  MCWidthScale*19

/** 时间间隔 */
#define kHUDDuration            (1.f)

/** 一天的秒数 */
#define SecondsOfDay            (24.f * 60.f * 60.f)
/** 秒数 */
#define Seconds(Days)           (24.f * 60.f * 60.f * (Days))

/** 一天的毫秒数 */
#define MillisecondsOfDay       (24.f * 60.f * 60.f * 1000.f)
/** 毫秒数 */
#define Milliseconds(Days)      (24.f * 60.f * 60.f * 1000.f * (Days))

#define kColorArr @[[UIColor colorWithRed:0.28 green:0.57 blue:0.80 alpha:1.00],[UIColor colorWithRed:0.92 green:0.64 blue:0.16 alpha:1.00],[UIColor colorWithRed:0.34 green:0.58 blue:0.46 alpha:1.00],[UIColor colorWithRed:0.77 green:0.71 blue:0.50 alpha:1.00],[UIColor colorWithHexString:@"#F4A460" alpha:1.0],[UIColor colorWithHexString:@"#D8BFD8" alpha:1.0],[UIColor colorWithHexString:@"#C0FF3E" alpha:1.0],[UIColor colorWithHexString:@"#A1A1A1" alpha:1.0],[UIColor colorWithHexString:@"#458B74" alpha:1.0],[UIColor colorWithHexString:@"#080808" alpha:1.0],[UIColor colorWithHexString:@"#0000AA" alpha:1.0],[UIColor colorWithHexString:@"#458B74" alpha:1.0],[UIColor colorWithHexString:@"#080808" alpha:1.0],[UIColor colorWithHexString:@"#0000AA" alpha:1.0],[UIColor colorWithRed:0.28 green:0.57 blue:0.80 alpha:1.00],[UIColor colorWithRed:0.92 green:0.64 blue:0.16 alpha:1.00],[UIColor colorWithRed:0.34 green:0.58 blue:0.46 alpha:1.00],[UIColor colorWithRed:0.77 green:0.71 blue:0.50 alpha:1.00],[UIColor colorWithHexString:@"#F4A460" alpha:1.0],[UIColor colorWithHexString:@"#D8BFD8" alpha:1.0],[UIColor colorWithRed:0.28 green:0.57 blue:0.80 alpha:1.00],[UIColor colorWithRed:0.92 green:0.64 blue:0.16 alpha:1.00],[UIColor colorWithRed:0.34 green:0.58 blue:0.46 alpha:1.00],[UIColor colorWithRed:0.77 green:0.71 blue:0.50 alpha:1.00],[UIColor colorWithHexString:@"#F4A460" alpha:1.0],[UIColor colorWithHexString:@"#D8BFD8" alpha:1.0],[UIColor colorWithHexString:@"#C0FF3E" alpha:1.0],[UIColor colorWithHexString:@"#A1A1A1" alpha:1.0],[UIColor colorWithHexString:@"#458B74" alpha:1.0],[UIColor colorWithHexString:@"#080808" alpha:1.0],[UIColor colorWithHexString:@"#0000AA" alpha:1.0],[UIColor colorWithHexString:@"#458B74" alpha:1.0],[UIColor colorWithHexString:@"#080808" alpha:1.0],[UIColor colorWithHexString:@"#0000AA" alpha:1.0],[UIColor colorWithRed:0.28 green:0.57 blue:0.80 alpha:1.00],[UIColor colorWithRed:0.92 green:0.64 blue:0.16 alpha:1.00],[UIColor colorWithRed:0.34 green:0.58 blue:0.46 alpha:1.00],[UIColor colorWithRed:0.77 green:0.71 blue:0.50 alpha:1.00],[UIColor colorWithHexString:@"#F4A460" alpha:1.0],[UIColor colorWithHexString:@"#D8BFD8" alpha:1.0],[UIColor colorWithRed:0.28 green:0.57 blue:0.80 alpha:1.00],[UIColor colorWithRed:0.92 green:0.64 blue:0.16 alpha:1.00],[UIColor colorWithRed:0.34 green:0.58 blue:0.46 alpha:1.00],[UIColor colorWithRed:0.77 green:0.71 blue:0.50 alpha:1.00],[UIColor colorWithHexString:@"#F4A460" alpha:1.0],[UIColor colorWithHexString:@"#D8BFD8" alpha:1.0],[UIColor colorWithHexString:@"#C0FF3E" alpha:1.0],[UIColor colorWithHexString:@"#A1A1A1" alpha:1.0],[UIColor colorWithHexString:@"#458B74" alpha:1.0],[UIColor colorWithHexString:@"#080808" alpha:1.0],[UIColor colorWithHexString:@"#0000AA" alpha:1.0],[UIColor colorWithHexString:@"#458B74" alpha:1.0],[UIColor colorWithHexString:@"#080808" alpha:1.0],[UIColor colorWithHexString:@"#0000AA" alpha:1.0],[UIColor colorWithRed:0.28 green:0.57 blue:0.80 alpha:1.00],[UIColor colorWithRed:0.92 green:0.64 blue:0.16 alpha:1.00],[UIColor colorWithRed:0.34 green:0.58 blue:0.46 alpha:1.00],[UIColor colorWithRed:0.77 green:0.71 blue:0.50 alpha:1.00],[UIColor colorWithHexString:@"#F4A460" alpha:1.0],[UIColor colorWithHexString:@"#D8BFD8" alpha:1.0],[UIColor colorWithRed:0.28 green:0.57 blue:0.80 alpha:1.00],[UIColor colorWithRed:0.92 green:0.64 blue:0.16 alpha:1.00],[UIColor colorWithRed:0.34 green:0.58 blue:0.46 alpha:1.00],[UIColor colorWithRed:0.77 green:0.71 blue:0.50 alpha:1.00],[UIColor colorWithHexString:@"#F4A460" alpha:1.0],[UIColor colorWithHexString:@"#D8BFD8" alpha:1.0],[UIColor colorWithHexString:@"#C0FF3E" alpha:1.0],[UIColor colorWithHexString:@"#A1A1A1" alpha:1.0],[UIColor colorWithHexString:@"#458B74" alpha:1.0],[UIColor colorWithHexString:@"#080808" alpha:1.0],[UIColor colorWithHexString:@"#0000AA" alpha:1.0],[UIColor colorWithHexString:@"#458B74" alpha:1.0],[UIColor colorWithHexString:@"#080808" alpha:1.0],[UIColor colorWithHexString:@"#0000AA" alpha:1.0],[UIColor colorWithRed:0.28 green:0.57 blue:0.80 alpha:1.00],[UIColor colorWithRed:0.92 green:0.64 blue:0.16 alpha:1.00],[UIColor colorWithRed:0.34 green:0.58 blue:0.46 alpha:1.00],[UIColor colorWithRed:0.77 green:0.71 blue:0.50 alpha:1.00],[UIColor colorWithHexString:@"#F4A460" alpha:1.0],[UIColor colorWithHexString:@"#D8BFD8" alpha:1.0],[UIColor colorWithRed:0.28 green:0.57 blue:0.80 alpha:1.00],[UIColor colorWithRed:0.92 green:0.64 blue:0.16 alpha:1.00],[UIColor colorWithRed:0.34 green:0.58 blue:0.46 alpha:1.00],[UIColor colorWithRed:0.77 green:0.71 blue:0.50 alpha:1.00],[UIColor colorWithHexString:@"#F4A460" alpha:1.0],[UIColor colorWithHexString:@"#D8BFD8" alpha:1.0],[UIColor colorWithHexString:@"#C0FF3E" alpha:1.0],[UIColor colorWithHexString:@"#A1A1A1" alpha:1.0],[UIColor colorWithHexString:@"#458B74" alpha:1.0],[UIColor colorWithHexString:@"#080808" alpha:1.0],[UIColor colorWithHexString:@"#0000AA" alpha:1.0],[UIColor colorWithHexString:@"#458B74" alpha:1.0],[UIColor colorWithHexString:@"#080808" alpha:1.0],[UIColor colorWithHexString:@"#0000AA" alpha:1.0],[UIColor colorWithRed:0.28 green:0.57 blue:0.80 alpha:1.00],[UIColor colorWithRed:0.92 green:0.64 blue:0.16 alpha:1.00],[UIColor colorWithRed:0.34 green:0.58 blue:0.46 alpha:1.00],[UIColor colorWithRed:0.77 green:0.71 blue:0.50 alpha:1.00],[UIColor colorWithHexString:@"#F4A460" alpha:1.0],[UIColor colorWithHexString:@"#D8BFD8" alpha:1.0],[UIColor colorWithRed:0.28 green:0.57 blue:0.80 alpha:1.00],[UIColor colorWithRed:0.92 green:0.64 blue:0.16 alpha:1.00],[UIColor colorWithRed:0.34 green:0.58 blue:0.46 alpha:1.00],[UIColor colorWithRed:0.77 green:0.71 blue:0.50 alpha:1.00],[UIColor colorWithHexString:@"#F4A460" alpha:1.0],[UIColor colorWithHexString:@"#D8BFD8" alpha:1.0],[UIColor colorWithHexString:@"#C0FF3E" alpha:1.0],[UIColor colorWithHexString:@"#A1A1A1" alpha:1.0],[UIColor colorWithHexString:@"#458B74" alpha:1.0],[UIColor colorWithHexString:@"#080808" alpha:1.0],[UIColor colorWithHexString:@"#0000AA" alpha:1.0],[UIColor colorWithHexString:@"#458B74" alpha:1.0],[UIColor colorWithHexString:@"#080808" alpha:1.0],[UIColor colorWithHexString:@"#0000AA" alpha:1.0],[UIColor colorWithRed:0.28 green:0.57 blue:0.80 alpha:1.00],[UIColor colorWithRed:0.92 green:0.64 blue:0.16 alpha:1.00],[UIColor colorWithRed:0.34 green:0.58 blue:0.46 alpha:1.00],[UIColor colorWithRed:0.77 green:0.71 blue:0.50 alpha:1.00],[UIColor colorWithHexString:@"#F4A460" alpha:1.0],[UIColor colorWithHexString:@"#D8BFD8" alpha:1.0],[UIColor colorWithHexString:@"#0000AA" alpha:1.0],[UIColor colorWithHexString:@"#458B74" alpha:1.0],[UIColor colorWithHexString:@"#080808" alpha:1.0],[UIColor colorWithHexString:@"#0000AA" alpha:1.0],[UIColor colorWithRed:0.28 green:0.57 blue:0.80 alpha:1.00],[UIColor colorWithRed:0.92 green:0.64 blue:0.16 alpha:1.00],[UIColor colorWithRed:0.34 green:0.58 blue:0.46 alpha:1.00],[UIColor colorWithRed:0.77 green:0.71 blue:0.50 alpha:1.00],[UIColor colorWithHexString:@"#F4A460" alpha:1.0],[UIColor colorWithHexString:@"#D8BFD8" alpha:1.0],[UIColor colorWithRed:0.28 green:0.57 blue:0.80 alpha:1.00],[UIColor colorWithRed:0.92 green:0.64 blue:0.16 alpha:1.00],[UIColor colorWithRed:0.34 green:0.58 blue:0.46 alpha:1.00],[UIColor colorWithRed:0.77 green:0.71 blue:0.50 alpha:1.00],[UIColor colorWithHexString:@"#F4A460" alpha:1.0],[UIColor colorWithHexString:@"#D8BFD8" alpha:1.0],[UIColor colorWithHexString:@"#C0FF3E" alpha:1.0],[UIColor colorWithHexString:@"#A1A1A1" alpha:1.0],[UIColor colorWithHexString:@"#458B74" alpha:1.0],[UIColor colorWithHexString:@"#080808" alpha:1.0],[UIColor colorWithHexString:@"#0000AA" alpha:1.0],[UIColor colorWithHexString:@"#458B74" alpha:1.0],[UIColor colorWithHexString:@"#080808" alpha:1.0],[UIColor colorWithHexString:@"#0000AA" alpha:1.0],[UIColor colorWithRed:0.28 green:0.57 blue:0.80 alpha:1.00],[UIColor colorWithRed:0.92 green:0.64 blue:0.16 alpha:1.00],[UIColor colorWithRed:0.34 green:0.58 blue:0.46 alpha:1.00],[UIColor colorWithRed:0.77 green:0.71 blue:0.50 alpha:1.00],[UIColor colorWithHexString:@"#F4A460" alpha:1.0],[UIColor colorWithHexString:@"#D8BFD8" alpha:1.0]];

// 宽度比例适配
#define XM_SCALE(value)     ceil(1.0 * (value) * WindowWidth / 375.0)

// 高度比例适配
#define XM_HEIGHT_SCALE(value)     ceil(1.0 * (value) * WindowHeight / 667.0)

//主色 黄色 深色
#define XM_ColorX203X154X102            XM_RGBColor(203, 154, 102)

#define XM_RGBColor(r, g, b)    XM_RGBColorAlpha(r, g, b, 1.0)

#define XM_RGBColorAlpha(r, g, b, a)    [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

#define XM_HEXColor(rgbValue)   XM_HEXRGBAColor(rgbValue, 1.0)

#define XM_HEXRGBAColor(rgbValue, a) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 \
alpha:a]

/// 安全区顶部高度（状态栏高度）
static inline CGFloat SafeAreaTop() {
    if (@available(iOS 11.0, *)) {
        return UIApplication.sharedApplication.delegate.window.safeAreaInsets.top;
    }
    return 0;
}

/// 安全区底部高度
static inline CGFloat SafeAreaBottom() {
    if (@available(iOS 11.0, *)) {
        return UIApplication.sharedApplication.delegate.window.safeAreaInsets.bottom;
    }
    return 0;
}

/// 是否刘海屏
static inline BOOL IsIphoneX() {
    return SafeAreaBottom() > 0;
}

static inline CGFloat StatusBarHeight() {
    return (IsIphoneX() ? 44.f : 20.f);
}

static inline UIImage * xm_imageName(NSString * name) {
    return [UIImage imageNamed:name];
}

// PingFangSC
#define XM_PingFangLight_Font(value)    [UIFont fontWithName:@"PingFangSC-Light" size:(value)]
#define XM_PingFangRegular_Font(value)  [UIFont fontWithName:@"PingFangSC-Regular" size:(value)]
#define XM_PingFangMedium_Font(value)   [UIFont fontWithName:@"PingFangSC-Medium" size:(value)]
#define XM_PingFangSemibold_Font(value) [UIFont fontWithName:@"PingFangSC-Semibold" size:(value)]
#define XM_PingFangHKSemibold_Font(value)   [UIFont fontWithName:@"PingFang-HK-Semibold" size:(value)]
#define XM_PingFangHKRegular_Font(value)   [UIFont fontWithName:@"PingFangHK-Regular" size:(value)]

#define SCREEN_WIDTH ([[UIScreen mainScreen]bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen]bounds].size.height)

#endif /* Macros_h */
