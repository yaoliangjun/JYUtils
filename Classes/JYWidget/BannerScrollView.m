//
//  BannerScrollView.m
//  JYUtils
//
//  Created by yaoliangjun on 2017/8/15.
//  Copyright © 2017年 Jerry Yao. All rights reserved.
//

#import "BannerScrollView.h"
#import "UIImageView+WebCache.h"

// UIScrollView的宽高
#define VIEW_WIDTH  self.frame.size.width
#define VIEW_HEIGHT self.frame.size.height
#define kHexRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface BannerScrollView () <UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView * scrollView;
@property (nonatomic, strong) UIPageControl *pageControl;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, assign) NSTimeInterval scrollTimeInterval;   // 图片滚动的时间间隔
@property (nonatomic, strong) NSArray *imageArray;                 // 存放UIImage对象的数组
@property (nonatomic, strong) NSArray *urlArray;                   // 存放图片url的数组
@property (nonatomic, strong) NSMutableArray *imageViews;          // 存放3个UIImageView的数组

@end

@implementation BannerScrollView

/** 图片数组初始化 */
- (instancetype)initWithFrame:(CGRect)frame
                   imageArray:(NSArray *)imageArray
           scrollTimeInterval:(NSTimeInterval)scrollTimeInterval
                  tapCallBack:(TapCallBack)tapCallBack
{
    if (self = [super initWithFrame:frame]) {
        self.bounds = frame;
        _imageArray = imageArray;
        _scrollTimeInterval = scrollTimeInterval;
        _tapCallBack = tapCallBack;

        [self setupSubViews];
    }

    return self;
}

/** 图片url数组初始化 */
- (instancetype)initWithFrame:(CGRect)frame
                     urlArray:(NSArray *)urlArray
           scrollTimeInterval:(NSTimeInterval)scrollTimeInterval
                  tapCallBack:(TapCallBack)tapCallBack
{
    if (self = [super initWithFrame:frame]) {
        self.bounds = frame;
        _urlArray = urlArray;
        _scrollTimeInterval = scrollTimeInterval;
        _tapCallBack = tapCallBack;

        [self setupSubViews];
    }

    return self;
}

#pragma mark - 初始化scrollview/分页控件/imageview
- (void)setupSubViews
{
    // 初始化UIScrollView
    [self addSubview:self.scrollView];

    // 初始化imageview
    NSInteger imagesCount = [_imageArray count] ? [_imageArray count] : [_urlArray count];
    _imageViews = [NSMutableArray array];

    //创建三个imageView作为循环复用的载体，图片将循环加载在这三个imageView上面
    if (imagesCount <= 1) {
        NSInteger index = 0;
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.frame = CGRectMake(0, 0, VIEW_WIDTH, VIEW_HEIGHT);
        imageView.userInteractionEnabled = YES;
        imageView.tag = index;

        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageViewClicked:)];
        [imageView addGestureRecognizer:tap];

        [self showImageView:imageView atIndex:index];
        [self addSubview:imageView];

    } else {
        for (NSInteger i = 0; i < 3; i++) {
            UIImageView *imageView = [[UIImageView alloc] init];
            imageView.frame = CGRectMake(VIEW_WIDTH * i, 0, VIEW_WIDTH, VIEW_HEIGHT);
            imageView.userInteractionEnabled = YES;

            NSInteger index = 0;
            if (i == 0) {
                index = imagesCount - 1;

            } else if (i == 1) {
                index = 0;

            } else if (i == 2) {
                index = 1;
            }
            imageView.tag = index;

            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageViewClicked:)];
            [imageView addGestureRecognizer:tap];

            // 设置imageView上的image图片
            [self showImageView:imageView atIndex:index];

            // 将imageView加入数组中，方便随后取用
            [_imageViews addObject:imageView];
            [self.scrollView addSubview:imageView];
        }
    }

    // 初始化pageControl,最后添加,这样它会显示在最前面,不会被遮挡
    [self addSubview:self.pageControl];
    self.pageControl.numberOfPages = imagesCount;

    // 当图片数量少于等于1张的时候隐藏pageControl,否则开启定时器
    if (imagesCount <= 1) {
        self.pageControl.hidden = YES;

    } else {
        [self startTimer];
    }
}

// 图片点击手势事件
- (void)imageViewClicked:(UITapGestureRecognizer *)tap
{
    int index = (int)tap.view.tag;
    if (_tapCallBack) {
        _tapCallBack(index);
    }
}

- (void)showImageView:(UIImageView *)imageView atIndex:(NSInteger)index
{
    NSUInteger imageCount = [_imageArray count];
    if (imageCount) {
        // 图片名字
        NSString *imageName = nil;
        if (index < _imageArray.count) {
            imageName = _imageArray[index];
        }
        imageView.image = [UIImage imageNamed:imageName];

    } else {
        // 图片的url
        NSString *imageUrl = nil;
        if (index < _urlArray.count) {
            imageUrl = _urlArray[index];
        }
        [imageView sd_setImageWithURL:[NSURL URLWithString:imageUrl] placeholderImage:[UIImage imageNamed:self.placeholderImageName]];
    }
}

// 定时器调用的方法
- (void)nextPage
{
    //NSLog(@"定时器的%f",_scrollView.contentOffset.x);
    //定时器方法都是相当于向左滑动,偏移量是增大的,原本偏移量是一倍的宽度,定时器方法执行一次,偏移量就要增大一个宽度,这样也就是setContentOffset:CGPointMake(VIEW_WIDTH * 2, 0),相当于设置偏移量是2倍宽度
    //执行了setContentOffset:方法,系统会自动调用scrollViewDidEndScrollingAnimation:方法,在这个方法里面再设置回偏移量等于一倍的宽度,同时更换各个imageview的图片,那么还是相当于中间的那个imageview显示在屏幕上
    [self.scrollView setContentOffset:CGPointMake(VIEW_WIDTH * 2, 0) animated:YES];
}

// 停止定时器
- (void)stopTimer
{
    if (_timer) {
        [_timer invalidate];
        _timer = nil;
    }
}

// 开启定时器
- (void)startTimer
{
    if (!_scrollTimeInterval) {
        _scrollTimeInterval = 2;
    }

    NSTimer *timer = [NSTimer timerWithTimeInterval:_scrollTimeInterval target:self selector:@selector(nextPage) userInfo:nil repeats:YES];
    // 加入NSRunLoopCommonModes运行模式,这样可以让定时器无论是在默认还是拖拽模式下都可以正常滚动
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    self.timer = timer;
}

#pragma mark - UIScrollViewDelegate代理方法
// 用户开始拖拽,停止定时器
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self stopTimer];
}

// 用户停止拖拽,开启定时器
- (void) scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self startTimer];
}

// 人为拖拽停止并且减速完全停止时会调用
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    // 在已经减速结束的时候进行图片更新，pagecontrol的更新
    [self updateImageViewsAndPageControl];
}

// 在调用setContentOffset方法的时候，会触发此代理方法
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {

    //在调用setContentOffset方法的时候，会触发此代理方法（避免在定时器控制偏移量的时候不刷新UI）
    [self updateImageViewsAndPageControl];
    // NSLog(@"滚动后的%f",_scrollView.contentOffset.x);
}

#pragma mark - 更新图片和分页控件的当前页
- (void)updateImageViewsAndPageControl {
    // 先判断出scrollview的操作行为是向左向右还是不动
    // 定义一个flag,目前是让scrollview向左向右滑动的时候索引对应的+1或者-1
    int flag = 0;
    if (self.scrollView.contentOffset.x > VIEW_WIDTH) {
        // 手指向左滑动
        flag = 1;

    } else if (self.scrollView.contentOffset.x == 0) {
        // 原本偏移量是一个宽度,现在==0了,那么就是手指向右滑动了
        // 手指向右滑动
        flag = -1;

    } else {
        // 除了向左向右之外就是没有移动,那么不需要任何操作，直接返回
        return;
    }

    //    NSInteger index = 0;
    // 修改imageViews中的imageView的tag值，从而修改imageView上显示的image，pageControl的页码
    for (UIImageView *imageView in _imageViews) {
        /*
         （1）当屏幕中间那个imageview显示最后一张图片时，右边的ImageView,也即下一张图片应该是显示最开始的那一张图片(第0张)；

         （2）当屏幕中间显示最开始的那一张图片(第0张)时，左边的ImageView,也即上一张图片应该是最后一张图片。
         */
        NSInteger index = imageView.tag + flag ;

        if (index < 0) {
            index = self.pageControl.numberOfPages - 1;
        } else if (index >= self.pageControl.numberOfPages) {
            index = 0;
        }

        imageView.tag = index;
        // 更新每一页上的image
        [self showImageView:imageView atIndex:index];
    }

    // 更新pageControl显示的页码,也就是中间那个imageview的tag值
    self.pageControl.currentPage = [_imageViews[1] tag];

    // 使用无动画的效果快速切换,也就是把scrollview的偏移量还设置成一个imageview的宽度
    // 这里是通过设置scrollview的偏移量让其来回滑动,时刻更换imageview的图片,每换一次,就立即让scrollview以无动画的方式再回到偏移量为一个imageview宽度的偏移量位置,即还是显示的中间那个imageview,以此给用户产生一种来回切换的错觉,实质一直是在显示中间那个imageview
    self.scrollView.contentOffset = CGPointMake(VIEW_WIDTH, 0);
}

- (UIScrollView *)scrollView
{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        _scrollView.contentSize = CGSizeMake(VIEW_WIDTH * 3, VIEW_HEIGHT);
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.pagingEnabled = YES;
        _scrollView.bounces = NO;
        _scrollView.contentOffset = CGPointMake(VIEW_WIDTH, 0);
        _scrollView.delegate = self;
    }
    return _scrollView;
}

- (UIPageControl *)pageControl
{
    if (!_pageControl) {
        _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.scrollView.frame) - 30, VIEW_WIDTH, 30)];
        _pageControl.currentPage = 0;
        _pageControl.pageIndicatorTintColor = kHexRGB(0x555555);
        _pageControl.currentPageIndicatorTintColor = kHexRGB(0xFAD780);
    }
    return _pageControl;
}

- (void)setPageIndicatorTintColor:(UIColor *)pageIndicatorTintColor
{
    _pageIndicatorTintColor = pageIndicatorTintColor;
    self.pageControl.pageIndicatorTintColor = pageIndicatorTintColor;
}

- (void)setCurrentPageIndicatorTintColor:(UIColor *)currentPageIndicatorTintColor
{
    _currentPageIndicatorTintColor = currentPageIndicatorTintColor;
    self.pageControl.currentPageIndicatorTintColor = currentPageIndicatorTintColor;
}

- (NSString *)placeholderImageName
{
    if (!_placeholderImageName) {
        _placeholderImageName = @"";
    }
    return _placeholderImageName;
}

- (void)dealloc {
    if (_timer) {
        [_timer invalidate];
        _timer = nil;
    }
}

@end

