//
//  IPMeView.m
//  InfinityProject
//
//  Created by Brandon Millman on 8/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "IPMeView.h"

#import "PrettyKit.h"

@interface IPMeView () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *profileHeaderView;

@end

@implementation IPMeView

@synthesize profileHeaderView = _profileHeaderView;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.profileHeaderView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        self.profileHeaderView.delegate = self;
        self.profileHeaderView.dataSource = self;
        self.profileHeaderView.bounces = NO;
        [self addSubview:self.profileHeaderView];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
//    if (self.notSelectedImage == nil) return;
//    
//    float desiredImageWidth = (self.frame.size.width - (self.leftMargin*2) - (self.midMargin*self.imageViews.count)) / self.imageViews.count;
//    float imageWidth = MAX(self.minImageSize.width, desiredImageWidth);
//    float imageHeight = MAX(self.minImageSize.height, self.frame.size.height);
//    
//    for (int i = 0; i < self.imageViews.count; ++i) {
//        
//        UIImageView *imageView = [self.imageViews objectAtIndex:i];
//        CGRect imageFrame = CGRectMake(self.leftMargin + i*(self.midMargin+imageWidth), 0, imageWidth, imageHeight);
//        imageView.frame = imageFrame;
//        
//    } 
    
    self.profileHeaderView.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, 300);
    
    
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    if (section == 0)
        return 2;
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    static NSString *SegmentedCellIdentifier = @"SegmentedCell";
    PrettySegmentedControlTableViewCell *segmentedCell;
    static NSString *GridCellIdentifier = @"GridCell";
    PrettyGridTableViewCell *gridCell;
    
    
    PrettyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[PrettyTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.tableViewBackgroundColor = tableView.backgroundColor; 
        cell.imageView.image = [UIImage imageNamed:@"MyReallyCoolImage.png"];
    }
    
//    switch (indexPath.section) {
//        case 1:
//            switch (indexPath.row) {
//                case 0:
//                    segmentedCell = [tableView dequeueReusableCellWithIdentifier:SegmentedCellIdentifier];
//                    if (segmentedCell == nil) {
//                        segmentedCell = [[PrettySegmentedControlTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:SegmentedCellIdentifier];
//                    }
//                    [segmentedCell prepareForTableView:tableView indexPath:indexPath];
//                    segmentedCell.titles = [NSArray arrayWithObjects:@"1", @"2", @"3", @"4", nil];
//                    segmentedCell.tableViewBackgroundColor = tableView.backgroundColor;
//                    return segmentedCell;
//                default:
//                    break;
//            }
//            
//            break;
//        case 2:
//            gridCell = [tableView dequeueReusableCellWithIdentifier:GridCellIdentifier];
//            if (gridCell == nil) {
//                gridCell = [[PrettyGridTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:GridCellIdentifier];
//                gridCell.tableViewBackgroundColor = tableView.backgroundColor;
//                gridCell.actionBlock = ^(NSIndexPath *indexPath, int selectedIndex) {
//                    [gridCell deselectAnimated:YES];
//                };                
//            }
//            [gridCell prepareForTableView:tableView indexPath:indexPath];            
//            gridCell.numberOfElements = 3;
//            [gridCell setText:@"One" atIndex:0];
//            [gridCell setDetailText:@"Detail Text" atIndex:0];
//            [gridCell setText:@"Two" atIndex:1];            
//            [gridCell setDetailText:@"Detail Text" atIndex:1];
//            [gridCell setText:@"Three" atIndex:2];
//            [gridCell setDetailText:@"Detail Text" atIndex:2];            
//            return gridCell;
//        case 4:
//            gridCell = [tableView dequeueReusableCellWithIdentifier:GridCellIdentifier];
//            if (gridCell == nil) {
//                gridCell = [[PrettyGridTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:GridCellIdentifier];
//                gridCell.tableViewBackgroundColor = tableView.backgroundColor;
//                gridCell.actionBlock = ^(NSIndexPath *indexPath, int selectedIndex) {
//                    [gridCell deselectAnimated:YES];
//                };                
//            }
//            [gridCell prepareForTableView:tableView indexPath:indexPath];            
//            gridCell.numberOfElements = 2;
//            [gridCell setText:@"Four" atIndex:0];
//            [gridCell setText:@"Five" atIndex:1];            
//            return gridCell;
//            
//        default:
//            break;
//    }
    
    // Configure the cell...
    [cell prepareForTableView:tableView indexPath:indexPath];
    cell.textLabel.text = @"Text";
    cell.cornerRadius = 5;
    
    return cell;
}


#pragma mark - Table view delegate

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return tableView.rowHeight + [PrettyTableViewCell tableView:tableView neededHeightForIndexPath:indexPath];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     [detailViewController release];
     */
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
