//
//  NowPlayingViewController.m
//  random
//
//  Created by jsood on 6/2/18.
//  Copyright © 2018 Jigyasaa Sood. All rights reserved.
//

#import "DetailViewController.h"
#import "NowPlayingViewController.h"
#import "NowPlayingMovieTableViewCell.h"
#import "UIImageView+AFNetworking.h"


@interface NowPlayingViewController ()

@property (nonatomic, strong) NSArray * movies; //like an instance variable
@property (nonatomic, strong) UIRefreshControl * refreshControl;

@end

@implementation NowPlayingViewController


NSDictionary * movies;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self fetchMovies];
    
    self.refreshControl = [[UIRefreshControl alloc]init];
    [self.refreshControl addTarget:self action:@selector(fetchMovies) forControlEvents:UIControlEventValueChanged];
    
    [self.tableView addSubview:self.refreshControl]; //attach the refreshcontrol to the tableView
   
    
    
}

-(void) fetchMovies{
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
                                                    
                                                    //NSLog(@"%@", dataDictionary); // to print the dataDictionary
                                                    
                                                    
                                                    
                                                    self.movies = dataDictionary[@"results"];
                                                    for(NSDictionary * movie in self.movies){
                                                        NSLog(@"%@", movie[@"title"]);
                                                        
                                                    }
                                                    
                                                    [self.tableView reloadData];
                                                    
                                                }
                                                [self.refreshControl endRefreshing];
                                            }];
    
    [task resume];
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    NowPlayingMovieTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"NowPlayingMovieTableViewCell" forIndexPath:indexPath];
    
    NSDictionary * movie = self.movies[indexPath.row];
    cell.titleLabel.text = movie[@"title"];
    cell.overviewLabel.text = movie[@"overview"];
    
    NSString * baseURLString = @"https://image.tmdb.org/t/p/w500";
    NSString * posterURLString = movie[@"poster_path"];
    NSString * posterURL = [baseURLString stringByAppendingString:posterURLString];
    NSURL * posterPathURL = [NSURL URLWithString:posterURL]; //checks if it's a valid URL
    
    [cell.posterImageView setImageWithURL:posterPathURL];
    
    return cell;
    
}


- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.movies.count;
   
 }

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    UITableViewCell * cell = sender;
    NSIndexPath * indexPath = [self.tableView indexPathForCell:cell];
    NSDictionary * movie = self.movies[indexPath.row];
    
    DetailViewController * detailView = [segue destinationViewController];
    detailView.movie = movie;
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */


@end
