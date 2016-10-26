//
//  ASDownloadManager.h
//  NewsApp
//
//  Created by Andrew Soroka on 10/25/16.
//  Copyright © 2016 Andrew Soroka. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASArticle.h"
#import "ASSource.h"

typedef void (^SourceFetchCompletion)(NSArray<ASSource *> *);
typedef void (^ArticleFetchCompletion)(NSArray<ASArticle *> *);

@interface ASDownloadManager : NSObject

+ (void)fetchAllSources:(void(^)(NSArray<ASSource *> *))handler;
+ (void)fetchArticlesForSourse:(ASSource *)source withHandler:(void(^)(NSArray<ASArticle *> *))handler;
+ (void)fetchSourcesForCategory:(NSString *)category withHandler:(SourceFetchCompletion)handler;

@end
