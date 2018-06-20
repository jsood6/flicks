//
//  DetailViewController.h
//  random
//
//  Created by jsood on 6/20/18.
//  Copyright © 2018 Jigyasaa Sood. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *backdropImageView;
@property (weak, nonatomic) IBOutlet UIImageView *posterImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *overiewLabel;

@property (nonatomic, strong) NSDictionary * movie;



@end
