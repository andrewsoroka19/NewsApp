//
//  ASSource.m
//  NewsApp
//
//  Created by Andrew Soroka on 10/25/16.
//  Copyright © 2016 Andrew Soroka. All rights reserved.
//

#import "ASSource.h"

@implementation ASSource

- (ASSource *)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        self.sourceName = dictionary[@"name"];
        self.sourceDescription = dictionary[@"description"];
        self.sourceID = dictionary[@"id"];;
        NSString *urlString = [dictionary valueForKeyPath:@"urlsToLogos.small"];   
        if (urlString) {
            self.sourceImageURL = [NSURL URLWithString:urlString];
        }
    }
    return self;
}

@end
