//
//  MoviesCollectionViewController.m
//  random
//
//  Created by jsood on 6/20/18.
//  Copyright © 2018 Jigyasaa Sood. All rights reserved.
//

#import "MoviesCollectionViewController.h"
#import "MoviesCollectionViewCell.h"
#import "UIImageView+AFNetworking.h"

@interface MoviesCollectionViewController ()

@property (nonatomic, strong) NSArray * movies; //like an instance variable


@end

@implementation MoviesCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    [self fetchMovies];
    
     UICollectionViewFlowLayout * layout = self.collectionView.collectionViewLayout;
    
    CGFloat postersPerLine = 2;
    CGFloat itemWidth = self.collectionView.frame.size.width / postersPerLine;
    CGFloat itemHeight = itemWidth * 1.5;
   
    layout.itemSize = CGSizeMake(itemWidth, itemHeight);
    
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
                                                    
                                                    [self.collectionView reloadData];
                                                    
                                                }
                                                //[self.refreshControl endRefreshing];
                                            }];
    
    [task resume];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    MoviesCollectionViewCell * cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"MoviesCollectionViewCell" forIndexPath:indexPath];
    
    NSDictionary * movie = self.movies[indexPath.item];
    
    NSString * baseURLString = @"https://image.tmdb.org/t/p/w500";
    NSString * posterURLString = movie[@"poster_path"];
    NSString * posterURL = [baseURLString stringByAppendingString:posterURLString];
    NSURL * posterPathURL = [NSURL URLWithString:posterURL]; //checks if it's a valid URL
    
    [cell.movieImageView setImageWithURL:posterPathURL];
    
    return cell;
    
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.movies.count;
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
