//
//  WRNewFeatureViewController.m
//  我的微博
//
//  Created by apple-jd28 on 15/10/19.
//  Copyright © 2015年 apple-jd28. All rights reserved.
//

#import "WRNewFeatureViewController.h"
#import "WRNewFeatureCell.h"

@interface WRNewFeatureViewController ()

@property (nonatomic, weak) UIPageControl *pageControl;

@end

@implementation WRNewFeatureViewController

static NSString * const reuseIdentifier = @"Cell";

-(instancetype)init
{
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    
    layout.itemSize = [UIScreen mainScreen].bounds.size;
    
    layout.minimumLineSpacing = 0;
    
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    return [super initWithCollectionViewLayout:layout];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.collectionView registerClass:[WRNewFeatureCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    self.collectionView.pagingEnabled = YES;
    self.collectionView.bounces = NO;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    
    [self setPageView];
}

- (void)setPageView
{
    UIPageControl *pageControl = [UIPageControl new];
    
    pageControl.numberOfPages = 4;
    pageControl.pageIndicatorTintColor = [UIColor blackColor];
    pageControl.currentPageIndicatorTintColor = [UIColor redColor];
    
    pageControl.center = CGPointMake(self.view.width*0.5, self.view.higth - 10);
    
    _pageControl = pageControl;
    
    [self.view addSubview:pageControl];
}


#pragma mark <UICollectionViewDataSource>


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return 4;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    WRNewFeatureCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    CGFloat screenH = [UIScreen mainScreen].bounds.size.height;
    
    NSString *imageName = [NSString stringWithFormat:@"new_feature_%ld",indexPath.row+1];
    
    if (screenH > 480) {
        imageName = [NSString stringWithFormat:@"new_feature_%ld-568h",indexPath.row+1];
    }
    
    cell.image = [UIImage imageNamed:imageName];
    
    
    [cell isLastPageWithIndexPath:indexPath count:4];
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>


#pragma mark -scrollViewDelegate 设置pageView

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offsetX = scrollView.contentOffset.x;
    CGFloat currentPage = offsetX / self.view.width * 1.0;
    self.pageControl.currentPage = round(currentPage);
}



@end
