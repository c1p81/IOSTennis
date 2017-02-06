//
//  InterfaceController.m
//  Tennis Score Board WatchKit Extension
//
//  Created by Luca Innocenti on 30/01/17.
//  Copyright © 2017 Luca Innocenti. All rights reserved.
//

#import "InterfaceController.h"

int puntisinistra = 0;
int puntidestra = 0;

int gamesinistra = 0;
int gamedestra = 0;

int setsinistra = 0;
int setdestra = 0;

int servizio = 1;

int storico [2000] [6];
int indice_storico = 0;

@interface InterfaceController()

@end


@implementation InterfaceController

- (void)cambio_palla
{
    servizio = servizio + 1;
    if ((servizio %2) == 0)
    {
        [self.serviceright setHidden:true];
        [self.serviceleft setHidden:NO];
    }
    else
    {
        [self.serviceright setHidden:NO];
        [self.serviceleft setHidden:true];
    }

}

- (void)update_score
{
    
    if ((puntisinistra == 4) && (puntidestra ==4))
    {
        puntidestra = 3;
        puntisinistra = 3;
    }
    
    if (puntisinistra == 5)
    {
        gamesinistra = gamesinistra + 1;
        puntidestra = 0;
        puntisinistra = 0;
        [self cambio_palla];
    }

    if (puntidestra == 5)
    {
        gamedestra = gamedestra + 1;
        puntidestra = 0;
        puntisinistra = 0;
        [self cambio_palla];
    }
    
    if ((puntisinistra == 4) && (puntidestra <3))
    {
        gamesinistra = gamesinistra + 1;
        puntidestra = 0;
        puntisinistra = 0;
        [self cambio_palla];
    }

    
    if ((puntidestra == 4) && (puntisinistra <3))
    {
        gamedestra = gamedestra + 1;
        puntidestra = 0;
        puntisinistra = 0;
        [self cambio_palla];
    }
    
    if ((gamedestra == 6) && (gamesinistra <=4))
    {
        gamedestra = 0;
        gamesinistra = 0;
        setdestra = setdestra + 1;
    }

    if ((gamedestra == 7) && (gamesinistra <=6))
    {
        gamedestra = 0;
        gamesinistra = 0;
        setdestra = setdestra + 1;
    }
    
    if ((gamesinistra == 6) && (gamedestra <= 4))
    {
        gamedestra = 0;
        gamesinistra = 0;
        setsinistra = setsinistra + 1;
    }

    if ((gamesinistra == 7) && (gamedestra <= 6))
    {
        gamedestra = 0;
        gamesinistra = 0;
        setsinistra = setsinistra + 1;
    }

    
    
    
    
    switch (puntidestra){
        case 0 : [_point_right setTitle:@"00"];
            break;
        case 1:  [_point_right setTitle:@"15"];
            break;
        case 2:  [_point_right setTitle:@"30"];
            break;
        case 3:  [_point_right setTitle:@"40"];
            break;
        case 4:  [_point_right setTitle:@"AD"];
            break;
    }
    
    switch (puntisinistra){
        case 0 : [_point_left setTitle:@"00"];
            break;
        case 1:  [_point_left setTitle:@"15"];
            break;
        case 2:  [_point_left setTitle:@"30"];
            break;
        case 3:  [_point_left setTitle:@"40"];
            break;
        case 4:  [_point_left setTitle:@"AD"];
            break;
            
    }
    
    [self.gameleft setText:@(gamesinistra).stringValue];
    [self.gameright setText:@(gamedestra).stringValue];
    
    [self.setleft setText:@(setsinistra).stringValue];
    [self.setright setText:@(setdestra).stringValue];
    
    if ((gamedestra == 6) && (gamesinistra ==6))
    {
        [self.tiebreak setText:@"TB"];
    }
    else
    {
        [self.tiebreak setText:@""];
    }
    
    NSLog(@"%d-%d Game %d-%d Set %d-%d",puntisinistra,puntidestra,gamesinistra,gamedestra,setsinistra,setdestra);

    
    indice_storico = indice_storico + 1;
    storico[indice_storico][0] = puntisinistra;
    storico[indice_storico][1] = puntidestra;
    storico[indice_storico][2] = gamesinistra;
    storico[indice_storico][3] = gamedestra;
    storico[indice_storico][4] = setsinistra;
    storico[indice_storico][5] = setdestra;

    return;
}

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    [self.serviceright setHidden:NO];
    [self.serviceleft setHidden:true];
    [self.tiebreak setText:@""];
    
    
    // Configure interface objects here.
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}
- (IBAction)add_point_right {
    //NSLog(@"punti destra");
    puntidestra = puntidestra +1 ;
    [self update_score];
    
}

- (IBAction)add_point_left {
    puntisinistra = puntisinistra +1;
    [self update_score];
}

- (IBAction)undo_bt {
    if (indice_storico >= 1)
    {
        indice_storico = indice_storico - 1;
        puntisinistra = storico[indice_storico][0];
        puntidestra = storico[indice_storico][1];
        gamesinistra = storico[indice_storico][2];
        gamedestra = storico[indice_storico][3];
        setsinistra = storico[indice_storico][4];
        setdestra = storico[indice_storico][5];
        [self update_score];
    }

}

@end



