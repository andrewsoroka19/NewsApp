//
//  ASArticlesViewController.h
//  NewsApp
//
//  Created by Andrew Soroka on 10/26/16.
//  Copyright © 2016 Andrew Soroka. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASArticle.h"

@interface ASArticlesViewController : UITableViewController

@property (strong, nonatomic) NSArray<ASArticle *> *articles;

@end
