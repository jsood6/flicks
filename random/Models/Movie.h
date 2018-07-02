//
//  Movie.h
//  random
//
//  Created by jsood on 6/25/18.
//  Copyright © 2018 Jigyasaa Sood. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Movie : NSObject
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *overview;
@property (nonatomic, strong) NSURL *posterUrl;

- (id)initWithDictionary:(NSDictionary *)dictionary;

+ (NSArray*)moviesWithDictionaries:(NSArray *)dictionaries;


@end
