//
//  YFJNewCategoryVc.m
//  一番街
//
//  Created by yifanjie on 2018/1/18.
//  Copyright © 2018年 caizhen. All rights reserved.
//

#import "YFJNewCategoryVc.h"
#import "YFJNewCategoryCollectionCell.h"
#import "YFJNewCategoryHeadReusableView.h"
@interface YFJNewCategoryVc ()<UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource>
{
    UIImageView *_headImageView;
}
@property(nonatomic,strong)UITableView *tableView;

@property(nonatomic,strong)UICollectionView *collectionView;

@property(nonatomic,strong)NSArray *titleArray;

@property(nonatomic,strong)NSArray *contentArray;

@end

@implementation YFJNewCategoryVc

-(NSArray *)titleArray
{
    if (!_titleArray) {
        _titleArray = @[@"美容护肤",@"彩妆香水",@"家居日用",@"健康保健",@"母婴专区",@"服饰鞋帽"];
    }
    return _titleArray;
}

-(NSArray *)contentArray
{
    if (!_contentArray) {
        _contentArray = @[@"洁面",@"卸妆",@"去角质",@"精华/美容液",@"洁面",@"化妆水"];
    }
    return _contentArray;
}

-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, WCX_SCALE_SCREEN_Height(89.5),self.view.yj_height) style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self.view addSubview:_tableView];
    }
    return _tableView;
}


-(UICollectionView *)collectionView
{
    if (!_collectionView) {
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        //列数
        CGFloat margin = WCX_SCALE_SCREEN_Width(4);
        //设置格子的宽高
        CGFloat itemW = WCX_SCALE_SCREEN_Height(89);
        CGFloat itemH = WCX_SCALE_SCREEN_Height(38);
        layout.itemSize = CGSizeMake(itemW, itemH);
        layout.sectionInset = UIEdgeInsetsMake(WCX_SCALE_SCREEN_Height(6), WCX_SCALE_SCREEN_Height(4), WCX_SCALE_SCREEN_Height(6), WCX_SCALE_SCREEN_Height(4));
        //设置格子的间距
        layout.minimumInteritemSpacing = margin;
        layout.minimumLineSpacing = margin;
       //设置section头试图的高度
        layout.headerReferenceSize = CGSizeMake(YFJScreenW-_tableView.yj_width,WCX_SCALE_SCREEN_Height(50));
        //设置collectionview
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_tableView.frame)+0.5,0, YFJScreenW-_tableView.yj_width, _tableView.yj_height) collectionViewLayout:layout];
        _collectionView.showsHorizontalScrollIndicator =NO;
        _collectionView.showsVerticalScrollIndicator = NO;
        //设置collection背景色
        _collectionView.backgroundColor = YFJBgColor;
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        
        _collectionView.contentInset = UIEdgeInsetsMake(WCX_SCALE_SCREEN_Height(106), 0, 0, 0);
        
        UIImageView *headImageView = [[UIImageView alloc]init];
        _headImageView = headImageView;
        headImageView.frame = CGRectMake(0, -WCX_SCALE_SCREEN_Height(106), YFJScreenW-WCX_SCALE_SCREEN_Height(90), WCX_SCALE_SCREEN_Height(106));
        [self.collectionView addSubview: headImageView];
        
        
        [self.view addSubview:_collectionView];
        //注册cell
        [_collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([YFJNewCategoryCollectionCell class]) bundle:nil] forCellWithReuseIdentifier:colectionID];
        //头部视图注册
        //注意：此处如果使用nib注册  赋值的时候会报错
        [_collectionView registerClass:[YFJNewCategoryHeadReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:colectionHeadID];
        
        
    }
    return _collectionView;
}
static NSString *colectionID = @"colectionID";
static NSString *colectionHeadID = @"headerViewIdentifier";
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = YFJGrayColor;
    [self loadDatas];
    
    [self setContent];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.titleArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return WCX_SCALE_SCREEN_Height(60);
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellID"];
        cell.selectedTextColor = YFJMainColor;
        cell.textLabel.text = self.titleArray[indexPath.row];
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
        [cell.textLabel setFont:[UIFont fontWithName:YFJFontNameRegular size:WCX_SCALE_SCREEN_Height(13)]];
        [cell.textLabel setTextColor:YFJColor(68, 68, 68)];
        cell.selectedBackgroundView = [[UIView alloc]initWithFrame:cell.frame];
        cell.selectedBackgroundView.backgroundColor = YFJBgColor;
        [cell setBackgroundColor:[UIColor clearColor]];
    }
    if (indexPath.row == 0) {
        [tableView selectRowAtIndexPath:indexPath animated:NO scrollPosition:UITableViewScrollPositionNone];
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    YFJLog(@"%ld",indexPath.row);
}



#pragma mark - UICollectionViewDataSource
// 指定Section个数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.titleArray.count;
}

// 指定section中的collectionViewCell的个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.contentArray.count;
}



//  返回头视图
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath

{
    UICollectionReusableView *reusableView =nil;
    //如果是头视图
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        YFJNewCategoryHeadReusableView *headView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:colectionHeadID forIndexPath:indexPath];
        headView.titleStr = self.titleArray[indexPath.section];
        reusableView = headView;
    }
    return reusableView;
    
    //如果底部视图
    
    //    if([kind isEqualToString:UICollectionElementKindSectionFooter]){
    
    //
    
    //    }
    
}

// 配置section中的collectionViewCell的显示
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    YFJNewCategoryCollectionCell *categoryCellectionCell = [collectionView dequeueReusableCellWithReuseIdentifier:colectionID forIndexPath:indexPath];
    
    categoryCellectionCell.titleStr = self.contentArray[indexPath.row];
    
    
    return categoryCellectionCell;
}


#pragma mark 设置tableview
-(void)setContent
{
    [self tableView];
    
    [self collectionView];
    
    _headImageView.backgroundColor = YFJRandomColor;

}



#pragma mark 网络请求
-(void)loadDatas
{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        // 2. 请求标题数据
        
        sleep(1);
        
        [self titleArray];
        
        dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
        [self.collectionView reloadData];
        });
        
    });
}

-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    _tableView.yj_height = self.view.yj_height;
    
    _collectionView.yj_height = self.view.yj_height;
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
