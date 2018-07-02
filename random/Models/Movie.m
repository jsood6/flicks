//
//  Movie.m
//  random
//
//  Created by jsood on 6/25/18.
//  Copyright © 2018 Jigyasaa Sood. All rights reserved.
//

#import "Movie.h"

@implementation Movie

- (id)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    
    self.title = dictionary[@"title"];
    NSString *posterURLString = dictionary[@"poster_path"];
    if (posterURLString != nil) {
        NSString *baseURLString = @"https://image.tmdb.org/t/p/w500";
        NSString *fullPosterURLString = [baseURLString stringByAppendingString:posterURLString];
        NSURL *posterURL = [NSURL URLWithString:fullPosterURLString];
        self.posterUrl = posterURL;
        
    }
    
    // Set the other properties from the dictionary
    
    return self;
}

+ (NSArray *)moviesWithDictionaries:(NSArray *)dictionaries{
    NSArray *moviesArray = dictionaries;
    NSMutableArray * moviesMutableArray;
    for (NSDictionary *dictionary in moviesArray) {
        Movie *movie = [[Movie alloc]initWithDictionary:dictionary];// Call the Movie initializer here
        [moviesMutableArray addObject:movie];
    }
    moviesArray = moviesMutableArray;
    return moviesArray;
}




@end
