//
//  HomeViewController.m
//  TopTableBar
//
//  Created by chenshuai on 17/8/3.
//  Copyright © 2017年 chenshuai. All rights reserved.
//

#import "HomeViewController.h"
#import "TopTitleLabel.h"
#import "ContentViewController.h"

@interface HomeViewController ()<UIScrollViewDelegate>
/**顶部标题 */
@property (nonatomic,strong) UIScrollView *titleScrollView;
/**底部内容 */
@property (nonatomic,strong) UIScrollView *contentScrollView;
/**顶部标题 */
@property (nonatomic,strong) UILabel *titleLabel;


@end
@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGFloat ScreenWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat ScreenHeight = [UIScreen mainScreen].bounds.size.height;
    _titleScrollView = [[UIScrollView alloc] init];
    _titleScrollView.frame = CGRectMake(0, 64, ScreenWidth, 35);
    _titleScrollView.backgroundColor = [UIColor redColor];
    _titleScrollView.delegate = self;
    [self.view addSubview:self.titleScrollView];
    _contentScrollView = [[UIScrollView alloc] init];
    _contentScrollView.frame = CGRectMake(0, 99, ScreenWidth, ScreenHeight - 99);
    _contentScrollView.backgroundColor = [UIColor blueColor];
    _contentScrollView.delegate = self;
    [self.view addSubview:self.contentScrollView];
    
    [self setupContentView];
    [self setupTopLabel];
    
    [self scrollViewDidEndScrollingAnimation:self.contentScrollView];
    
}

- (void)setupContentView {
    ContentViewController *view0 = [[ContentViewController alloc] init];
    view0.title = @"View0";
    [self addChildViewController:view0];
    
    ContentViewController *view1 = [[ContentViewController alloc] init];
    view1.title = @"View1";
    [self addChildViewController:view1];
    
    ContentViewController *view2 = [[ContentViewController alloc] init];
    view2.title = @"View2";
    [self addChildViewController:view2];
    
    ContentViewController *view3 = [[ContentViewController alloc] init];
    view3.title = @"View3";
    [self addChildViewController:view3];
    
    ContentViewController *view4 = [[ContentViewController alloc] init];
    view4.title = @"View4";
    [self addChildViewController:view4];
    
    ContentViewController *view5 = [[ContentViewController alloc] init];
    view5.title = @"View5";
    [self addChildViewController:view5];
    
    ContentViewController *view6 = [[ContentViewController alloc] init];
    view6.title = @"View6";
    [self addChildViewController:view6];
}

- (void)setupTopLabel {
    CGFloat labelW = 100;
    CGFloat labelY = 0;
    CGFloat labelH = self.titleScrollView.frame.size.height;
    for(NSInteger i = 0;i < 7;i++) {
        TopTitleLabel *label = [[TopTitleLabel alloc] init];
        label.text = [self.childViewControllers[i] title];
        CGFloat labelX = i * labelW;
        label.frame = CGRectMake(labelX, labelY, labelW, labelH);
        [label addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickLabel:)]];
        label.tag = i;
        [self.titleScrollView addSubview:label];
        if(i == 0) {
            label.scale = 1.0;
        }
    }
    
    CGFloat ScreenW = [UIScreen mainScreen].bounds.size.width;
    self.titleScrollView.contentSize = CGSizeMake(7 * labelW, 0);
    self.contentScrollView.contentSize = CGSizeMake(7 * ScreenW, 0);
}

- (void)clickLabel:(UITapGestureRecognizer *)tap {
    NSInteger index = tap.view.tag;
    CGPoint offset = self.contentScrollView.contentOffset;
    offset.x = index * self.contentScrollView.frame.size.width;
    [self.contentScrollView setContentOffset:offset animated:YES];
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    
    CGFloat width = scrollView.frame.size.width;
    CGFloat height = scrollView.frame.size.height;
    CGFloat offsetX = scrollView.contentOffset.x;
    
    NSInteger index = offsetX / width;
    
    TopTitleLabel *label = self.titleScrollView.subviews[index];
    CGPoint titleOffset = self.titleScrollView.contentOffset;
    titleOffset.x = label.center.x - width * 0.5;
    
    if(titleOffset.x < 0) titleOffset.x = 0;
    CGFloat maxTitleOffsetX = self.titleScrollView.contentSize.width - width;
    if(titleOffset.x > maxTitleOffsetX) titleOffset.x = maxTitleOffsetX;
    
    [self.titleScrollView setContentOffset:titleOffset animated:YES];
    
//    for(TopTitleLabel *otherLabel in self.titleScrollView.subviews) {
//        if(otherLabel != label) otherLabel.scale = 0.0;
//    }
    
    UIViewController *willShowVc = self.childViewControllers[index];
    
    if([willShowVc isViewLoaded]) return;
    
    willShowVc.view.frame = CGRectMake(offsetX, 0, width, height);
    [scrollView addSubview:willShowVc.view];
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    [self scrollViewDidEndScrollingAnimation:scrollView];
}

//- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    CGFloat scale = scrollView.contentOffset.x / scrollView.frame.size.height;
//    if(scale < 0 || scale > self.titleScrollView.subviews.count - 1) return;
//    
//    NSInteger leftIndex = scale;
//    TopTitleLabel *leftLabel = self.titleScrollView.subviews[leftIndex];
//    
//    NSInteger rightIndex = leftIndex + 1;
//    TopTitleLabel *rightLabel = (rightIndex == self.titleScrollView.subviews.count) ? nil : self.titleScrollView.subviews[rightIndex];
//    
//    CGFloat rightScale = scale - leftIndex;
//    CGFloat leftScale = 1 - rightScale;
//    
//    leftLabel.scale = leftScale;
//    rightLabel.scale = rightScale;
//}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
