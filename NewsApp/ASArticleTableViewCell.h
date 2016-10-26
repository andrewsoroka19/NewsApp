//
//  ASArticleTableViewCell.h
//  NewsApp
//
//  Created by Andrew Soroka on 10/26/16.
//  Copyright © 2016 Andrew Soroka. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASArticle.h"

@interface ASArticleTableViewCell : UITableViewCell

@property (strong, nonatomic) ASArticle *article;

+ (NSString *)reuseIdentifier;

@end
