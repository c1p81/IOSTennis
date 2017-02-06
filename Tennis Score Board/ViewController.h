//
//  ViewController.h
//  Tennis Score Board
//
//  Created by Luca Innocenti on 30/01/17.
//  Copyright © 2017 Luca Innocenti. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *point_left;
@property (weak, nonatomic) IBOutlet UIButton *point_right;

@property (weak, nonatomic) IBOutlet UILabel *setleft;
@property (weak, nonatomic) IBOutlet UILabel *setright;


@property (weak, nonatomic) IBOutlet UIImageView *serviceleft;
@property (weak, nonatomic) IBOutlet UIImageView *serviceright;

@property (weak, nonatomic) IBOutlet UILabel *gameleft;
@property (weak, nonatomic) IBOutlet UILabel *gameright;


@property (weak, nonatomic) IBOutlet UILabel *tiebreak;

@property (weak, nonatomic) IBOutlet UIButton *undo;
@end

