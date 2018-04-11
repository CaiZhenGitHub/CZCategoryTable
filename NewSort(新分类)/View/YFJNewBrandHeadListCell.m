//
//  YFJNewBrandHeadListCell.m
//  一番街
//
//  Created by yifanjie on 2018/1/19.
//  Copyright © 2018年 caizhen. All rights reserved.
//

#import "YFJNewBrandHeadListCell.h"
#import "YFJNewBrandListCollectionCell.h"
@interface YFJNewBrandHeadListCell()<UICollectionViewDelegate,UICollectionViewDataSource>
{
    UICollectionView *_collectionView;
}
@end

@implementation YFJNewBrandHeadListCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setContent];
    }
    return self;
}

-(void)setCollectionArray:(NSArray *)collectionArray
{
    _collectionArray = collectionArray;
    
    [_collectionView reloadData];
}


-(void)setContent
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    //间距
    CGFloat margin = WCX_SCALE_SCREEN_Width(0.5);
    //设置格子的宽高
    CGFloat itemW = ((YFJScreenW-WCX_SCALE_SCREEN_Width(30))-1)/3;
    
    layout.itemSize = CGSizeMake(itemW, itemW);
    
    //设置格子的间距
    layout.minimumInteritemSpacing = margin;
    layout.minimumLineSpacing = margin;

    //设置collectionview
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
    _collectionView.showsHorizontalScrollIndicator =NO;
    _collectionView.showsVerticalScrollIndicator = NO;
    _collectionView.scrollEnabled = NO;
    //设置collection背景色
    _collectionView.backgroundColor = YFJBgColor;
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    
    [self.contentView addSubview:_collectionView];
    //注册cell
   
    [_collectionView registerClass:[YFJNewBrandListCollectionCell class] forCellWithReuseIdentifier:colectionID];
    
}
static NSString *colectionID = @"colectionID";
//有多少个Section
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
//每个section有多少个元素
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.collectionArray.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    YFJNewBrandListCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:colectionID forIndexPath:indexPath];
    
    cell.titleStr = self.collectionArray[indexPath.row];
    
    return cell;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.mas_offset(0);
    }];
}


@end
