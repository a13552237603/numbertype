//
//  SearchViewCell.m
//  数字键盘
//
//  Created by 贺恒涛 on 16/6/23.
//  Copyright © 2016年 贺恒涛. All rights reserved.
//

#import "SearchViewCell.h"
#import "HotSearchCollectionViewCell.h"

#define KHotSearchCollectClass @"HotSearchCollectionViewCell"
#define KHotSearchCellId @"HotSearchCellId"
#define KSearchHotFooterId @"HotSearchFooter"
#define HEX_COLOR(x_RGB) [UIColor colorWithRed:((float)((x_RGB & 0xFF0000) >> 16))/255.0 green:((float)((x_RGB & 0xFF00) >> 8))/255.0 blue:((float)(x_RGB & 0xFF))/255.0 alpha:1.0f]
@interface SearchViewCell() <UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic ,strong) NSMutableArray *dataArr;
@property (nonatomic, strong) UICollectionView *HotCollectionView;

@end

@implementation SearchViewCell 

- (UICollectionView *)HotCollectionView{
    
    if (!_HotCollectionView) {
        UICollectionViewFlowLayout *layOut = [UICollectionViewFlowLayout new];
        _HotCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0,0,[UIScreen mainScreen].bounds.size.width,300) collectionViewLayout:layOut];
        //这是重点 自动适应
        layOut.estimatedItemSize = CGSizeMake(15, 15);
        layOut.scrollDirection = UICollectionViewScrollDirectionVertical;
        layOut.minimumInteritemSpacing = 5;
        layOut.minimumLineSpacing = 15;
        _HotCollectionView.delegate = self;
        _HotCollectionView.dataSource = self;
        _HotCollectionView.scrollEnabled = NO;
        _HotCollectionView.backgroundColor = HEX_COLOR(0xF2F2F2);
        [self.contentView addSubview:_HotCollectionView];
        [_HotCollectionView registerNib:[UINib nibWithNibName:KHotSearchCollectClass bundle:nil] forCellWithReuseIdentifier:KHotSearchCellId];
    }
    return _HotCollectionView;
}

- (NSMutableArray *)dataArr{
    if (!_dataArr) {
        _dataArr = [NSMutableArray new];
    }
    return _dataArr;
}
- (void)infortdataArr:(NSMutableArray *)arr{
    self.dataArr = arr;
    [self.HotCollectionView reloadData];
}


- (void)awakeFromNib {
    // Initialization code
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return self.dataArr.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    HotSearchCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:KHotSearchCellId forIndexPath:indexPath];
    if (self.dataArr.count !=0) {
        cell.labeltitle.text = self.dataArr[indexPath.row];
    }
    return cell;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return CGSizeMake(20,30);
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(15,15, 15, 15);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    
    return CGSizeMake(self.frame.size.width, 300);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
