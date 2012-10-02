//
//  IPUserModel.h
//  InfinityProject
//
//  Created by Brandon Millman on 9/29/12.
//
//

#import <Foundation/Foundation.h>

@interface IPUserModel : NSObject

@property (nonatomic, assign) NSInteger uId;
@property (nonatomic, copy) NSString *firstName;
@property (nonatomic, copy) NSString *lastName;
@property (nonatomic, copy) NSString *email;
@property (nonatomic, copy) NSArray *submissions;

@end
