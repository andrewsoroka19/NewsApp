//
//  ASNews.h
//  NewsApp
//
//  Created by Andrew Soroka on 10/25/16.
//  Copyright © 2016 Andrew Soroka. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ASArticle : NSObject

@property (strong,nonatomic) NSString *articleTitle;
@property (strong,nonatomic) NSString *articleDescription;
@property (strong,nonatomic) NSURL *articleURL;
@property (strong, nonatomic) NSURL *articleImageURL;

- (ASArticle *)initWithDictionary:(NSDictionary *)dictionary;

@end
