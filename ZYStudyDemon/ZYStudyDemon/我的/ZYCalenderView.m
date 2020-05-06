//
//  ZYCalenderView.m
//  ZYStudyDemon
//
//  Created by yong on 2020/5/6.
//  Copyright © 2020 yong zhang. All rights reserved.
//

#import "ZYCalenderView.h"
#import "ZYCollectionHeaderView.h"

#define SCREENWIDTH [UIScreen mainScreen].bounds.size.width
#define CALENDERCELL @"ZYCalenderCell"
#define CALENDERHEADERVIEW @"ZYCollectionHeaderView"




@interface ZYCalenderView ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic,   strong)  UICollectionView *calenderView;
@property (nonatomic,   strong)  UICollectionViewFlowLayout *collectionViewLayout;
@property (nonatomic,   strong)  UICollectionReusableView *heaerView;
@end

@implementation ZYCalenderView
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self.calenderView registerNib:[UINib nibWithNibName:CALENDERCELL bundle:nil] forCellWithReuseIdentifier:CALENDERCELL];
        [self.calenderView registerNib:[UINib nibWithNibName:CALENDERHEADERVIEW bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:CALENDERHEADERVIEW];
        [self addSubview:self.calenderView];
        self.calenderView.dataSource = self;
        self.calenderView.delegate = self;
    }
    return self;
}
-(UICollectionView *)calenderView
{
    if (!_calenderView) {
        _calenderView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENWIDTH+56) collectionViewLayout:self.collectionViewLayout];
    }
    return _calenderView;
}
-(UICollectionViewFlowLayout *)collectionViewLayout
{
    if (!_collectionViewLayout) {
        _collectionViewLayout = [[UICollectionViewFlowLayout alloc]init];
        _collectionViewLayout.minimumLineSpacing = .5;
        _collectionViewLayout.minimumInteritemSpacing = .5;
        _collectionViewLayout.itemSize = CGSizeMake((SCREENWIDTH-6)/7, (SCREENWIDTH-6)/7);
        _collectionViewLayout.headerReferenceSize = CGSizeMake(SCREENWIDTH, 50);
        _collectionViewLayout.scrollDirection = self.scrollDirection;
    }
    return _collectionViewLayout;
}
-(__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return [collectionView dequeueReusableCellWithReuseIdentifier:CALENDERCELL forIndexPath:indexPath];
}
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
     ZYCollectionHeaderView*headerView =  [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:CALENDERHEADERVIEW forIndexPath:indexPath];
//    [headerView settingDefaultWords];
    return headerView;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 42;
}
@end
