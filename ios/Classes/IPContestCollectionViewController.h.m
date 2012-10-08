//
//  IPContestCollectionViewController.m
//  InfinityProject
//
//  Created by Brandon Millman on 9/29/12.
//
//

#import "IPContestCollectionViewController.h"

#import "IPContestPreviewCell.h"
#import "IPContestModel.h"
#import "UIImageView+AFNetworking.h"
#import "SSPullToRefresh.h"
#import "IPContestViewController.h"

@interface IPContestCollectionViewController () <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, SSPullToRefreshViewDelegate>

@property (nonatomic, strong) NSArray *contests;
@property (nonatomic, strong) UICollectionView *contestsView;
@property (nonatomic, strong) SSPullToRefreshView *pullToRefreshView;

@end

@implementation IPContestCollectionViewController

@synthesize contests = _contests;
@synthesize contestsView = _contestsView;
@synthesize pullToRefreshView = _pullToRefreshView;

#pragma mark - UIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor darkGrayColor];
    
    /////////////Start Fake Contest Data///////////////
    IPContestModel *contest1 = [[IPContestModel alloc] init];
    contest1.uId = 1;
    contest1.trophyImageUrl = @"http://i.imgur.com/cSqBd.jpg";
    contest1.phrase = @"Yolo yo";
    contest1.submissionIds = @[@43534543, @45345, @657567, @567756];
    
    IPContestModel *contest2 = [[IPContestModel alloc] init];
    contest2.uId = 2;
    contest2.trophyImageUrl = @"http://i.imgur.com/cSqBa.jpg";
    contest2.phrase = @"Yolo yo";
    contest2.submissionIds = @[@43534543, @45345, @657567, @567756];
    
    IPContestModel *contest3 = [[IPContestModel alloc] init];
    contest3.uId = 3;
    contest3.trophyImageUrl = @"http://i.imgur.com/cSqBb.jpg";
    contest3.phrase = @"Yolo yo";
    contest3.submissionIds = @[@43534543, @45345, @657567, @567756];
    
    IPContestModel *contest4 = [[IPContestModel alloc] init];
    contest4.uId = 4;
    contest4.trophyImageUrl = @"http://i.imgur.com/cSqBc.jpg";
    contest4.phrase = @"Yolo yo";
    contest4.submissionIds = @[@43534543, @45345, @657567, @567756];
    
    IPContestModel *contest5 = [[IPContestModel alloc] init];
    contest5.uId = 5;
    contest5.trophyImageUrl = @"http://i.imgur.com/cSqBj.jpg";
    contest5.phrase = @"Yolo yo";
    contest5.submissionIds = @[@43534543, @45345, @657567, @567756];
    
    self.contests = @[contest1, contest2, contest3, contest4, contest5];
    /////////////End Fake Contest Data///////////////
    
    UICollectionViewFlowLayout *viewLayout = [[UICollectionViewFlowLayout alloc] init];
    CGRect contestsViewFrame = self.view.bounds;
    contestsViewFrame.size.height -= (44 + 49); //adjust for navigation and tab bar
    self.contestsView = [[UICollectionView alloc] initWithFrame:contestsViewFrame collectionViewLayout:viewLayout];
    self.contestsView.backgroundColor = [UIColor clearColor];
    [self.contestsView registerClass:[IPContestPreviewCell class] forCellWithReuseIdentifier:@"ContestPreviewCell"];
    self.contestsView.delegate = self;
    self.contestsView.dataSource = self;
    [self.contestsView reloadData];
    
    [self.view addSubview:self.contestsView];
    
    self.pullToRefreshView = [[SSPullToRefreshView alloc] initWithScrollView:self.contestsView delegate:self];

}



#pragma mark - UICollectionView Datasource

- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section
{
    return [self.contests count];
}

- (NSInteger)numberOfSectionsInCollectionView: (UICollectionView *)collectionView
{
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    IPContestPreviewCell *cell = [cv dequeueReusableCellWithReuseIdentifier:@"ContestPreviewCell" forIndexPath:indexPath];
    IPContestModel *selectedContest = [self.contests objectAtIndex:indexPath.row];
    if (!cell) 
        cell = [IPContestPreviewCell cellWithContest:selectedContest];
    else
        cell.contest = selectedContest;
    return cell;
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    IPContestModel *selectedContest = [self.contests objectAtIndex:indexPath.row];
    IPContestViewController *selectedController = [IPContestViewController controllerWithContest:selectedContest];
    [self.navigationController pushViewController:selectedController animated:YES];
}
- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    // TODO: Deselect item
}

#pragma mark – UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return [IPContestPreviewCell size];
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 10;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 10;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(10, 10, 10, 10);
}

#pragma mark - SSPullToRefreshViewDelegate

- (void)refresh {
    [self.pullToRefreshView startLoading];
    
    [self.pullToRefreshView finishLoading];
}

- (void)pullToRefreshViewDidStartLoading:(SSPullToRefreshView *)view {
    [self refresh];
}


@end
