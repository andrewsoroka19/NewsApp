//
//  ASSourceTableViewCell.h
//  NewsApp
//
//  Created by Andrew Soroka on 10/26/16.
//  Copyright © 2016 Andrew Soroka. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASSource.h"

@interface ASSourceTableViewCell : UITableViewCell

@property (strong, nonatomic) ASSource *source;

+ (NSString *)reuseIdentifier;

@end
