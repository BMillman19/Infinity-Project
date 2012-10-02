//
//  IPContestModel.h
//  InfinityProject
//
//  Created by Brandon Millman on 9/29/12.
//
//

#import <Foundation/Foundation.h>

@interface IPContestModel : NSObject

@property (nonatomic, assign) NSInteger uId;
@property (nonatomic, copy) NSString *trophyImageUrl;
@property (nonatomic, copy) NSString *phrase;
@property (nonatomic, copy) NSArray *submissionIds;

@end
