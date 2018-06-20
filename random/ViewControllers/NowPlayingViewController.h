//
//  NowPlayingViewController.h
//  random
//
//  Created by jsood on 6/2/18.
//  Copyright © 2018 Jigyasaa Sood. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NowPlayingViewController.h"

@interface NowPlayingViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end
