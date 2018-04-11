//
//  YFJNewBrandListVc.m
//  一番街
//
//  Created by yifanjie on 2018/1/18.
//  Copyright © 2018年 caizhen. All rights reserved.
//

#import "YFJNewBrandListVc.h"
#import "YFJNewBrandHeadListCell.h"
#import "YFJNewBrandListCell.h"
#import "YFJNewBrandSectionHeadView.h"
#import "MJNIndexView.h"
@interface YFJNewBrandListVc ()<UITableViewDelegate,UITableViewDataSource,MJNIndexViewDataSource>

@property(nonatomic,strong)UITableView *tableView;

@property(nonatomic,strong)NSArray *titleArray;

@property(nonatomic,strong)NSArray *collectionArray;

/** 索引 */
@property(strong, nonatomic) MJNIndexView *indexView;

@end

@implementation YFJNewBrandListVc


-(NSArray *)collectionArray
{
    if (!_collectionArray) {
        _collectionArray = @[@"贝亲",@"贝亲",@"贝亲",@"贝亲",@"贝亲",@"贝亲",@"贝亲",@"贝亲",@"贝亲",@"贝亲",@"贝亲",@"贝亲",@"贝亲",@"贝亲",@"贝亲",@"贝亲",@"贝亲",@"贝亲",@"贝亲"];
    }
    return _collectionArray;
}

-(NSArray *)titleArray
{
    if (!_titleArray) {
        _titleArray = @[@"热",@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z"];
    }
    return _titleArray;
}

-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, YFJScreenW-WCX_SCALE_SCREEN_Width(30),self.view.yj_height) style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self.view addSubview:_tableView];
    }
    return _tableView;
}
#pragma mark tableview DataSource
//组数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.titleArray.count;
}
//行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
//行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return self.collectionArray.count/3*WCX_SCALE_SCREEN_Height(115);//返回collection总高度
    }else
    {
        return WCX_SCALE_SCREEN_Height(49);
    }
}

//cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        YFJNewBrandHeadListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"headListID"];
        if (!cell) {
            cell = [[YFJNewBrandHeadListCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"headListID"];
        }
        cell.collectionArray = self.collectionArray;
        return cell;
    }
    else
    {
        YFJNewBrandListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"listID"];
        if (!cell) {
            cell = [[YFJNewBrandListCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"listID"];
        }
        return cell;
    }
    
}
//组头高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return WCX_SCALE_SCREEN_Height(24);
}

//组头视图
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    YFJNewBrandSectionHeadView *sectionHeadView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"headID"];
    if (!sectionHeadView) {
         sectionHeadView = [[YFJNewBrandSectionHeadView alloc]initWithReuseIdentifier:@"headID"];
    }
    
    sectionHeadView.titleStr = self.titleArray[section];
    
    return sectionHeadView;
}

//设置右侧

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self tableView];
    
    [self initialiseMJNIndexView];
    
    [self loadDatas];
}

/**
 *  初始化MJNIndexView
 */
- (void)initialiseMJNIndexView{
    self.indexView = [[MJNIndexView alloc]initWithFrame:CGRectMake(0, -(WCX_SCALE_SCREEN_Height(54)+WCX_SCALE_SCREEN_Height(42)), YFJScreenW, YFJScreenH)];
    self.indexView.dataSource = self;
    self.indexView.fontColor = YFJTitleColor;
    self.indexView.font = [UIFont fontWithName:YFJFontNameRegular size:WCX_SCALE_SCREEN_Height(11)];
    self.indexView.selectedItemFont = [UIFont fontWithName:YFJFontNameRegular size:WCX_SCALE_SCREEN_Height(60)];
    self.indexView.itemsAligment = NSTextAlignmentCenter;
    self.indexView.curtainFade = 0.0;
    self.indexView.rightMargin = WCX_SCALE_SCREEN_Width(10);
    self.indexView.maxItemDeflection = 75;
    self.indexView.rangeOfDeflection = 3;
    self.indexView.darkening = NO;
    [self.view addSubview:self.indexView];
}

#pragma mark - <MJNIndexViewDataSource>

- (NSArray *)sectionIndexTitlesForMJNIndexView:(MJNIndexView *)indexView
{
    return self.titleArray;
}

- (void)sectionForSectionMJNIndexTitle:(NSString *)title atIndex:(NSInteger)index;
{
    [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForItem:0
                                                                       inSection:index] atScrollPosition: UITableViewScrollPositionTop     animated:YES];
}



#pragma mark 网络请求
-(void)loadDatas
{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        // 2. 请求标题数据
        
        sleep(1);
        
        [self titleArray];
        [self collectionArray];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
            
        });
        
    });
}


-(void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    self.tableView.yj_height = self.view.yj_height;
    self.indexView.yj_height = self.view.yj_height;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
