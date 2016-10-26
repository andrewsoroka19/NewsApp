//
//  ASDownloadManager.m
//  NewsApp
//
//  Created by Andrew Soroka on 10/25/16.
//  Copyright © 2016 Andrew Soroka. All rights reserved.
//

#import "ASDownloadManager.h"
#import <AFNetworking/AFNetworking.h>
                                 
@implementation ASDownloadManager

NSString * const allSourceURL = @"https://newsapi.org/v1/sources";
NSString * const apiKey = @"262fcd3d295b4304ba053ac59ef70492";
NSString * const article = @"https://newsapi.org/v1/articles";

+ (void)fetchAllSources:(SourceFetchCompletion)handler
{
    if (!handler) {
        return;
    }
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    [manager GET:allSourceURL parameters: nil progress: nil success:^(NSURLSessionDataTask *task, id responseObject) {
        if ([responseObject isKindOfClass:NSDictionary.class] == NO) {
            handler(nil);
            return;
        }
        NSArray *results = responseObject[@"sources"];
        NSMutableArray *sources = [NSMutableArray array];
        for (NSDictionary *dictionary in results) {
            ASSource *source = [[ASSource alloc] initWithDictionary:dictionary];
            if (source) {
                [sources addObject:source];
            }
        }
        handler(sources);
    }
         failure:^(NSURLSessionDataTask *task, NSError *error) {
             NSLog(@"Error : %@", error.localizedDescription);
             handler(nil);
         }];
}

+ (void)fetchSourcesForCategory:(NSString *)category withHandler:(SourceFetchCompletion)handler {
    if (!handler) {
        return;
    }
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    [manager GET:allSourceURL parameters: @{@"category" : category} progress: nil success:^(NSURLSessionDataTask *task, id responseObject) {
        if ([responseObject isKindOfClass:NSDictionary.class] == NO) {
            handler(nil);
            return;
        }
        NSArray *results = responseObject[@"sources"];
        NSMutableArray *sources = [NSMutableArray array];
        for (NSDictionary *dictionary in results) {
            ASSource *source = [[ASSource alloc] initWithDictionary:dictionary];
            if (source) {
                [sources addObject:source];
            }
        }
        handler(sources);
    }
         failure:^(NSURLSessionDataTask *task, NSError *error) {
             NSLog(@"Error : %@", error.localizedDescription);
             handler(nil);
         }];
}

+ (void)fetchArticlesForSourse:(ASSource *)source withHandler:(ArticleFetchCompletion)handler
{
    if (!handler) {
        return;
    }
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    NSDictionary *parameters = @{@"source" : source.sourceID,
                                 @"apiKey" : apiKey};
    
    [manager GET:article parameters: parameters progress: nil success:^(NSURLSessionDataTask *task, id responseObject) {
        if ([responseObject isKindOfClass:NSDictionary.class] == NO) {
            handler(nil);
            return;
        }
        NSArray *results = responseObject[@"articles"];
        NSMutableArray *articles = [NSMutableArray array];
        for (NSDictionary *dictionary in results) {
            ASArticle *article = [[ASArticle alloc] initWithDictionary:dictionary];
            if (article) {
                [articles addObject:article];
            }
        }
        handler(articles);
    }
         failure:^(NSURLSessionDataTask *task, NSError *error) {
             NSLog(@"Error : %@", error.description);
             handler(nil);
         }];
}

@end
