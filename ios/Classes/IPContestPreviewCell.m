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
#import <QuartzCore/QuartzCore.h>


#define kIPContestPreviewCellHeight 145
#define kIPContestPreviewCellWidth 145
#define kShakeKey @"SHAKE_ANIMATION"


@interface IPContestPreviewCell () 

@property (nonatomic, strong) UIImageView *trophyImage;

@end

@implementation IPContestPreviewCell

@synthesize contest = _contest;

#pragma mark - Class factory

+ (id)cellWithContest:(IPContestModel *)contest
{
    IPContestPreviewCell *cell = [[self alloc] initWithFrame:CGRectMake(0, 0, kIPContestPreviewCellWidth, kIPContestPreviewCellHeight)];
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
        
//        UILongPressGestureRecognizer *pressRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handlePress:)];
//        pressRecognizer.minimumPressDuration = 0;
//        [self addGestureRecognizer:pressRecognizer];
        
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

#pragma mark - Instance Methods
- (void)shakeStatus:(BOOL)enabled
{
    if (enabled)
    {
        CGFloat rotation = 0.03;
        
        CABasicAnimation *shake = [CABasicAnimation animationWithKeyPath:@"transform"];
        shake.duration = 0.13;
        shake.autoreverses = YES;
        shake.repeatCount  = MAXFLOAT;
        shake.removedOnCompletion = NO;
        shake.fromValue = [NSValue valueWithCATransform3D:CATransform3DRotate(self.layer.transform,-rotation, 0.0 ,0.0 ,1.0)];
        shake.toValue   = [NSValue valueWithCATransform3D:CATransform3DRotate(self.layer.transform, rotation, 0.0 ,0.0 ,1.0)];
        
        [self.layer addAnimation:shake forKey:kShakeKey];
    }
    else
    {
        [self.layer removeAnimationForKey:kShakeKey];
    }
}

//- (void)handlePress:(UILongPressGestureRecognizer *)recognizer
//{
//    if (recognizer.state == UIGestureRecognizerStateBegan) {
//        [self shakeStatus:YES];
//    } else {
//        [self shakeStatus:NO];
//    }
//}

@end
