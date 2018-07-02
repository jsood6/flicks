//
//  NowPlayingMovieTableViewCell.m
//  random
//
//  Created by jsood on 6/3/18.
//  Copyright © 2018 Jigyasaa Sood. All rights reserved.
//

#import "NowPlayingMovieTableViewCell.h"
#import "UIImageView+AFNetworking.h"

@implementation NowPlayingMovieTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setMovie:(Movie *)movie {
    // Since we're replacing the default setter, we have to set the underlying private storage _movie ourselves.
    // _movie was an automatically declared variable with the @propery declaration.
    // You need to do this any time you create a custom setter.
    self.movie = movie;
    
    self.titleLabel.text = self.movie.title;
    self.overviewLabel.text = self.movie.overview;
    
    self.posterImageView.image = nil;
    if (self.movie.posterUrl != nil) {
        [self.posterImageView setImageWithURL:self.movie.posterUrl];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
