//
//  IPContestViewController.h
//  InfinityProject
//
//  Created by Brandon Millman on 10/2/12.
//
//

#import <UIKit/UIKit.h>

@class IPContestModel;

@interface IPContestViewController : UIViewController

+(id)controllerWithContest:(IPContestModel *)contest;

@property (nonatomic, weak) IPContestModel *contest;

@end
