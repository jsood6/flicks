//
//  MoviesCollectionViewController.h
//  random
//
//  Created by jsood on 6/20/18.
//  Copyright © 2018 Jigyasaa Sood. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MoviesCollectionViewController : UIViewController<UICollectionViewDataSource, UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;


@end
