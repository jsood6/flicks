//
//  DetailViewController.m
//  random
//
//  Created by jsood on 6/20/18.
//  Copyright © 2018 Jigyasaa Sood. All rights reserved.
//

#import "DetailViewController.h"
#import "UIImageView+AFNetworking.h"


@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSDictionary * currMovie = self.movie;
    if(currMovie != NULL){
        self.titleLabel.text = currMovie[@"title"];
        self.overiewLabel.text = currMovie[@"overview"];
        
        //building poster url
        NSString * baseURLString = @"https://image.tmdb.org/t/p/w500";
        NSString * posterURLString = currMovie[@"poster_path"];
        NSString * posterURL = [baseURLString stringByAppendingString:posterURLString];
        NSURL * posterPathURL = [NSURL URLWithString:posterURL]; //checks if it's a valid URL
        
        [self.posterImageView setImageWithURL:posterPathURL];
       
        //building backdrop url
        NSString * backdropBaseURLString = @"https://image.tmdb.org/t/p/w500";
        NSString * backdropURLString = currMovie[@"backdrop_path"];
        NSString * backdropURL = [baseURLString stringByAppendingString:backdropURLString];
        NSURL * backdropPathURL = [NSURL URLWithString:backdropURL]; //checks if it's a valid URL
        
        [self.backdropImageView setImageWithURL:backdropPathURL];
        
        [self.titleLabel sizeToFit];
        
    }
    
    // Do any additional setup after loading the view.
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
