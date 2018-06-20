//
//  NowPlayingMovieTableViewCell.h
//  random
//
//  Created by jsood on 6/3/18.
//  Copyright © 2018 Jigyasaa Sood. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NowPlayingMovieTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *overviewLabel;
@property (weak, nonatomic) IBOutlet UIImageView *posterImageView;


@end
