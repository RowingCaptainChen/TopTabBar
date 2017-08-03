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

@interface HomeViewController ()
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
    [self.view addSubview:self.titleScrollView];
    _contentScrollView = [[UIScrollView alloc] init];
    _contentScrollView.frame = CGRectMake(0, 99, ScreenWidth, ScreenHeight - 99);
    _contentScrollView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:self.contentScrollView];
    
    [self setupContentView];
    [self setupTopLabel];
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
        NSLog(@"---%@",label.text);
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
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
