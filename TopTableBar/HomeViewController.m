//
//  HomeViewController.m
//  TopTableBar
//
//  Created by chenshuai on 17/8/3.
//  Copyright © 2017年 chenshuai. All rights reserved.
//

#import "HomeViewController.h"
#import "TopTitleLabel.h"

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
    
    [self setupTopLabel];
    [self setupContentView];
}

- (void)setupContentView {
    
}
- (void)setupTopLabel {
    CGFloat labelW = 100;
    CGFloat labelY = 0;
    CGFloat labelH = self.contentScrollView.frame.size.height;
    for(NSInteger i = 0;i < 7;i++) {
        TopTitleLabel *label = [[TopTitleLabel alloc] init];
        label.text = [self.childViewControllers[i] title];
        CGFloat labelX = i * labelW;
        label.frame = CGRectMake(labelX, labelY, labelW, labelH);
        [label addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickLabel:)]];
        label.tag = i;
        [self.titleScrollView addSubview:label];
    
    }
    
    CGFloat ScreenW = [UIScreen mainScreen].bounds.size.width;
    self.titleScrollView.contentSize = CGSizeMake(7 * labelW, 0);
    self.contentScrollView.contentSize = CGSizeMake(7 * ScreenW, 0);
}

- (void)clickLabel:(UITapGestureRecognizer *)tap {
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
