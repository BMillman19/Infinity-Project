//
//  IPSubmissionModel.h
//  InfinityProject
//
//  Created by Brandon Millman on 9/29/12.
//
//

#import <Foundation/Foundation.h>

@interface IPSubmissionModel : NSObject

@property (nonatomic, assign) NSInteger uId;
@property (nonatomic, copy) NSString *imageUrl;
@property (nonatomic, assign) NSInteger *ownerId;

@end
