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
#import "Movie.h"
#import "MoviesAPIManager.h"


@interface NowPlayingViewController ()

@property (nonatomic, strong) NSMutableArray * movies; //like an instance variable
@property (nonatomic, strong) UIRefreshControl * refreshControl;

@end

@implementation NowPlayingViewController


//NSDictionary * movies;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    //[self fetchMovies];
    // new is an alternative syntax to calling alloc init.
    MoviesAPIManager *manager = [MoviesAPIManager new];
    [manager fetchNowPlaying:^(NSMutableArray *movies, NSError *error) {
        self.movies = movies;
        NSLog(@"%@", self.movies);
        [self.tableView reloadData];
    }];
    
    
    //self.refreshControl = [[UIRefreshControl alloc]init];
    //[self.refreshControl addTarget:self action:@selector([manager fetchNowPlaying]) forControlEvents:UIControlEventValueChanged];
    
    //[self.tableView addSubview:self.refreshControl]; //attach the refreshcontrol to the tableView
    
    
    
    
}


- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    NowPlayingMovieTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"NowPlayingMovieTableViewCell" forIndexPath:indexPath];
    
    cell.movie = self.movies[indexPath.row];
    
    
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
