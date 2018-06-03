//
//  ViewController.m
//  random
//
//  Created by jsood on 6/2/18.
//  Copyright © 2018 Jigyasaa Sood. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSURL *url = [NSURL URLWithString:@"https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url
                                             cachePolicy:NSURLRequestReloadIgnoringLocalCacheData
                                         timeoutInterval:10.0];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]
                                                          delegate:nil
                                                     delegateQueue:[NSOperationQueue mainQueue]];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request
                                            completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                
                                                if (error != nil) {
                                                    NSLog(@"%@", [error localizedDescription]);
                                                }
                                                else {
                                                    NSDictionary *dataDictionary = [NSJSONSerialization JSONObjectWithData:data
                                                                                                                   options:NSJSONReadingMutableContainers
                                                                                                                     error:nil];
                                                    
                                                    // TODO: Get the array of movies
                                                    // TODO: Store the movies in a property to use elsewhere
                                                    // TODO: Reload your table view data
                                                }
                                            }];
    [task resume];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
