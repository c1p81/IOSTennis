//
//  InterfaceController.h
//  Tennis Score Board WatchKit Extension
//
//  Created by Luca Innocenti on 30/01/17.
//  Copyright © 2017 Luca Innocenti. All rights reserved.
//

#import <WatchKit/WatchKit.h>
#import <Foundation/Foundation.h>

@interface InterfaceController : WKInterfaceController


@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceImage *serviceright;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceButton *point_right;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceImage *serviceleft;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel *tiebreak;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceButton *point_left;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel *gamericht;

@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel *gameleft;

@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel *gameright;

@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel *setleft;

@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel *setright;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceButton *undo;


@end
