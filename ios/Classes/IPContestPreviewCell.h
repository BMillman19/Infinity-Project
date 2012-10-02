//
//  IPContestPreviewCell.h
//  InfinityProject
//
//  Created by Brandon Millman on 10/1/12.
//
//

#import <UIKit/UIKit.h>

@class IPContestModel;

@interface IPContestPreviewCell : UICollectionViewCell

+ (IPContestPreviewCell *)cellWithContest:(IPContestModel *)contest;
+ (CGSize)size;
+ (CGFloat)width;
+ (CGFloat)height;

@property (nonatomic, strong) IPContestModel *contest;

@end
