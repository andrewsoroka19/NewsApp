//
//  ASSource.h
//  NewsApp
//
//  Created by Andrew Soroka on 10/25/16.
//  Copyright © 2016 Andrew Soroka. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ASSource : NSObject

@property (strong,nonatomic) NSString *sourceName;
@property (strong,nonatomic) NSString *sourceDescription;
@property (strong,nonatomic) NSString *sourceID;
@property (strong, nonatomic) NSURL *sourceImageURL;

- (ASSource *)initWithDictionary:(NSDictionary *)dictionary;

@end
