//
//  MoviesAPIManager.h
//  random
//
//  Created by jsood on 7/1/18.
//  Copyright © 2018 Jigyasaa Sood. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MoviesAPIManager : NSObject

@property (nonatomic, strong) NSURLSession *session;

- (void)fetchNowPlaying:(void(^)(NSMutableArray *movies, NSError *error))completion;

@end
