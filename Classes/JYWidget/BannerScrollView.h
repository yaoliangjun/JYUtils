//
//  BannerScrollView.h
//  JYUtils
//
//  Created by yaoliangjun on 2017/8/15.
//  Copyright © 2017年 Jerry Yao. All rights reserved.
//  轮播图

#import <UIKit/UIKit.h>

typedef void (^TapCallBack) (NSInteger index);

@interface BannerScrollView : UIView

/** 点击图片回调的block */
@property (nonatomic, copy) TapCallBack tapCallBack;

/**
 *  创建轮播器的构造方法
 *  @param frame                轮播器的frame
 *  @param scrollTimeInterval   轮播器图片的切换时间
 *  @param imageArray           轮播器图片UIImage
 *  @param tapCallBack          点击轮播器imageview回调的block
 *  @return 返回轮播图控件
 */
- (instancetype)initWithFrame:(CGRect)frame
                   imageArray:(NSArray *)imageArray
           scrollTimeInterval:(NSTimeInterval)scrollTimeInterval
                  tapCallBack:(TapCallBack)tapCallBack;

/**
 *  创建轮播器的构造方法
 *  @param frame                轮播器的frame
 *  @param scrollTimeInterval   轮播器图片的切换时间
 *  @param urlArray             轮播器图片的URL
 *  @param tapCallBack          点击轮播器imageview回调的block
 *  @return 返回轮播图控件
 */
- (instancetype)initWithFrame:(CGRect)frame
                     urlArray:(NSArray *)urlArray
           scrollTimeInterval:(NSTimeInterval)scrollTimeInterval
                  tapCallBack:(TapCallBack)tapCallBack;

/** UIPageControl小圆点默认颜色 */
@property (nonatomic, strong) UIColor *pageIndicatorTintColor;

/** UIPageControl小圆点选中颜色 */
@property (nonatomic, strong) UIColor *currentPageIndicatorTintColor;

/** 占位图片名称 */
@property (nonatomic, copy) NSString *placeholderImageName;

@end

