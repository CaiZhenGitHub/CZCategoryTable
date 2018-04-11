//
//  YFJNewSortVc.m
//  一番街
//
//  Created by yifanjie on 2018/1/18.
//  Copyright © 2018年 caizhen. All rights reserved.
//

#import "YFJNewSortVc.h"
#import "UIButton+EXT.h"
#import "YFJNewCategoryVc.h"
#import "YFJNewBrandListVc.h"

@interface YFJNewSortVc ()
{
    UIView *_titleView;
    UIView *_lineView;
    UIButton *_preBtn;
    YFJNewCategoryVc *_firstVc;
    YFJNewBrandListVc *_secondVc;
}

@property(nonatomic,strong)UIScrollView *scrollView;

@end

@implementation YFJNewSortVc


-(UIScrollView *)scrollView
{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, YFJStatusHeight+WCX_SCALE_SCREEN_Height(54), YFJScreenW, YFJScreenH-YFJStatusHeight-WCX_SCALE_SCREEN_Height(54)-YFJTabBarHeight)];
        _scrollView.scrollEnabled = NO;
        _scrollView.contentSize = CGSizeMake(2*YFJScreenW,0);
        _scrollView.pagingEnabled = YES;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.showsHorizontalScrollIndicator = NO;
        [self.view addSubview:_scrollView];
    }
    return _scrollView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //添加子控制器
    [self addChildVc];
    
    [self setTopSearchView];
    
    
    
}
-(void)addChildVc
{
    YFJNewCategoryVc *firstVc = [[YFJNewCategoryVc alloc]init];
    _firstVc = firstVc;
    [self addChildViewController:firstVc];
    
    YFJNewBrandListVc *secondVc = [[YFJNewBrandListVc alloc]init];
    _secondVc = secondVc;
    [self addChildViewController:secondVc];
}

#pragma mark 布局子控件
-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    
    _firstVc.view.frame =CGRectMake(0, 0, YFJScreenW, _scrollView.yj_height);
    _secondVc.view.frame = CGRectMake(YFJScreenW, 0, YFJScreenW, _scrollView.yj_height);
}


-(void)setTopSearchView
{
    
    UIView *titleView = [[UIView alloc]initWithFrame:CGRectMake(0, YFJStatusHeight, YFJScreenW, WCX_SCALE_SCREEN_Height(54))];
    _titleView = titleView;
    [self.view addSubview:titleView];
    
    UIButton *sortBtn = [[UIButton alloc]init];
    sortBtn.tag = 0;
    [sortBtn normalTitleColor:YFJNextTitleColor];
    [sortBtn normalTitle:@"分类"];
    [sortBtn selectTitleColor:YFJColor(244,62,112)];
    [sortBtn.titleLabel setFont:[UIFont fontWithName:YFJFontNameMedium size:WCX_SCALE_SCREEN_Height(15)]];
    [sortBtn addTarget:self action:@selector(changeVcClick:) forControlEvents:UIControlEventTouchDown];
    [titleView addSubview:sortBtn];
    
    
    UIButton *brandBtn = [[UIButton alloc]init];
    brandBtn.tag = 1;
    [brandBtn normalTitleColor:YFJNextTitleColor];
    [brandBtn normalTitle:@"品牌"];
    [brandBtn selectTitleColor:YFJColor(244,62,112)];
    [brandBtn.titleLabel setFont:[UIFont fontWithName:YFJFontNameMedium size:WCX_SCALE_SCREEN_Height(15)]];
    [brandBtn addTarget:self action:@selector(changeVcClick:) forControlEvents:UIControlEventTouchDown];
    [titleView addSubview:brandBtn];
    
    [sortBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(WCX_SCALE_SCREEN_Width(50));
        make.right.mas_equalTo(brandBtn.mas_left).offset(0);
        make.top.bottom.mas_offset(0);
        make.size.mas_equalTo(brandBtn);
    }];
    
    [brandBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(sortBtn.mas_right).offset(0);
        make.right.mas_offset(WCX_SCALE_SCREEN_Width(-50));
        make.top.bottom.mas_offset(0);
        make.size.mas_equalTo(sortBtn);
    }];
    
    UIView *lineView = [[UIView alloc]init];
    _lineView = lineView;
    lineView.backgroundColor = YFJMainColor;
    [titleView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_offset(WCX_SCALE_SCREEN_Height(-8));
        make.height.mas_offset(WCX_SCALE_SCREEN_Height(2));
        make.centerX.mas_equalTo(sortBtn);
        make.width.mas_offset(WCX_SCALE_SCREEN_Width(45));
    }];
    
    UIView *bottomLineView = [[UIView alloc]init];
    bottomLineView.backgroundColor = YFJColor(221,221,221);
    [titleView addSubview:bottomLineView];
    [bottomLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_offset(0);
        make.height.mas_offset(0.5);
    }];
    
    [self scrollView];
    
    [self changeVcClick:sortBtn];
    
}

-(void)changeVcClick:(UIButton *)btn
{
    if (btn == _preBtn ) {
        return;
    }
    
    btn.selected = YES;
    _preBtn.selected = NO;
    _preBtn = btn;
    
    [UIView animateWithDuration:0.3f animations:^{
        _lineView.yj_centerX = btn.yj_centerX;
    }];
    
    //懒加载子控制器的view
    UIViewController *contentVc = self.childViewControllers[btn.tag];
    
    NSInteger index = btn.tag;
    [_scrollView setContentOffset:CGPointMake(YFJScreenW * index, 0) animated:YES];
    if([contentVc.view superview]){
        return;
    }
    [_scrollView addSubview:contentVc.view];
    
}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
