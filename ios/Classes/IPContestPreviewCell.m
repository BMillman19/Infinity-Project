//
//  IPContestPreviewCell.m
//  InfinityProject
//
//  Created by Brandon Millman on 10/1/12.
//
//

#import "IPContestPreviewCell.h"

#import "UIImageView+AFNetworking.h"
#import "IPContestModel.h"

#define kIPContestPreviewCellHeight 145
#define kIPContestPreviewCellWidth 145


@interface IPContestPreviewCell () 

@property (nonatomic, strong) UIImageView *trophyImage;

@end

@implementation IPContestPreviewCell

@synthesize contest = _contest;

#pragma mark - Class factory

+ (IPContestPreviewCell *)cellWithContest:(IPContestModel *)contest
{
    IPContestPreviewCell *cell = [[IPContestPreviewCell alloc] initWithFrame:CGRectMake(0, 0, kIPContestPreviewCellWidth, kIPContestPreviewCellHeight)];
    cell.contest = contest;
    return cell;
}


#pragma mark - Initializer and Dealloc

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.contentView.backgroundColor = [UIColor whiteColor];
        self.trophyImage = [[UIImageView alloc] initWithFrame:CGRectMake(self.bounds.origin.x + 5, self.bounds.origin.y + 5, self.bounds.size.width - 10, self.bounds.size.height - 10)];
        [self.contentView addSubview:self.trophyImage];
    }
    return self;
}

- (void)dealloc
{
    [self.trophyImage cancelImageRequestOperation];
}

#pragma mark - Accessors

- (void)setContest:(IPContestModel *)contest
{
    _contest = contest;
    [self.trophyImage setImageWithURL:[NSURL URLWithString:_contest.trophyImageUrl]];
}

#pragma mark - Class Methods

+ (CGSize)size
{
    return CGSizeMake(kIPContestPreviewCellWidth, kIPContestPreviewCellHeight);
}

+ (CGFloat)width
{
    return kIPContestPreviewCellWidth;
}

+ (CGFloat)height
{
    return kIPContestPreviewCellHeight;
}

@end
