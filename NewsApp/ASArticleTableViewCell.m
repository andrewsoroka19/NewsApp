//
//  ASArticleTableViewCell.m
//  NewsApp
//
//  Created by Andrew Soroka on 10/26/16.
//  Copyright © 2016 Andrew Soroka. All rights reserved.
//

#import "ASArticleTableViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface ASArticleTableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *sourceImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;

@end

@implementation ASArticleTableViewCell

+ (NSString *)reuseIdentifier
{
    return @"ASArticleTableViewCell";
}

- (void)prepareForReuse
{
    [super prepareForReuse];
    self.sourceImageView.image = nil;
    self.titleLabel.text = nil;
    self.descriptionLabel.text = nil;
}

- (void)setArticle:(ASArticle *)article
{
    _article = article;
    self.titleLabel.text = article.articleTitle;
    self.descriptionLabel.text = article.articleDescription ;
    if (article.articleImageURL) {
        [self.sourceImageView sd_setImageWithURL:article.articleImageURL placeholderImage:nil];
    }
}

@end
