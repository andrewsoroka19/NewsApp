//
//  ASSourceTableViewCell.m
//  NewsApp
//
//  Created by Andrew Soroka on 10/26/16.
//  Copyright © 2016 Andrew Soroka. All rights reserved.
//

#import "ASSourceTableViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface ASSourceTableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *sourceImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;

@end

@implementation ASSourceTableViewCell

+ (NSString *)reuseIdentifier
{
    return @"ASSourceTableViewCell";
}

- (void)prepareForReuse
{
    [super prepareForReuse];
    self.sourceImageView.image = nil;
    self.titleLabel.text = nil;
    self.descriptionLabel.text = nil;
}

- (void)setSource:(ASSource *)sourse
{
    _source = sourse;
    self.titleLabel.text = sourse.sourceName;
    self.descriptionLabel.text = sourse.sourceDescription;
    if (sourse.sourceImageURL) {
        [self.sourceImageView sd_setImageWithURL:sourse.sourceImageURL placeholderImage:nil];
    }
}

@end
