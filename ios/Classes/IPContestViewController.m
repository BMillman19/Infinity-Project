//
//  IPContestViewController.m
//  InfinityProject
//
//  Created by Brandon Millman on 10/2/12.
//
//

#import "IPContestViewController.h"

@interface IPContestViewController ()

@end

@implementation IPContestViewController

@synthesize contest;

#pragma mark - Class Factory

+(id)controllerWithContest:(IPContestModel *)contest
{
    IPContestViewController* controller = [[self alloc] init];
    controller.contest = contest;
    return controller;
}

#pragma mark - Initializers and Dealloc

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    
}

#pragma mark - Accessors

-(void)setContest:(IPContestModel *)contest
{
    
}

#pragma mark - UIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor darkGrayColor];
    
}



@end
