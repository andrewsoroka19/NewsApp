//
//  ASCategorySearchController.h
//  NewsApp
//
//  Created by Andrew Soroka on 10/26/16.
//  Copyright © 2016 Andrew Soroka. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ASCategorySearchController : UITableViewController

@property (nonatomic, copy) void (^selectCategoryCompletion)(NSString *);

@end
