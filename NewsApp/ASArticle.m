//
//  ASNews.m
//  NewsApp
//
//  Created by Andrew Soroka on 10/25/16.
//  Copyright © 2016 Andrew Soroka. All rights reserved.
//

#import "ASArticle.h"

@implementation ASArticle

- (ASArticle *)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        self.articleTitle = dictionary[@"name"];
        self.articleDescription = dictionary[@"description"];
        NSString *articleURLString = dictionary[@"url"];
        if (articleURLString) {
            self.articleURL = [NSURL URLWithString:articleURLString];
        }
        NSString *articleURLImageString = dictionary[@"urlToImage"];
        if (articleURLImageString) {
            self.articleImageURL = [NSURL URLWithString:articleURLImageString];
        }
    }
    return self;
}


@end
