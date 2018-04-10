//
//  ViewController.m
//  CalendarComposer
//
//  Created by Narlei Moreira on 05/06/15.
//  Copyright (c) 2015 Narlei Moreira. All rights reserved.
//

#import "ViewController.h"
#import "CalendarioMananger.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (IBAction)pressed:(id)sender {
    
    UIView *viewPulse = [[UIView alloc] initWithFrame:self.button.frame];
    [viewPulse setAlpha:0];
    [viewPulse setBackgroundColor:[UIColor colorWithRed:0.153 green:0.742 blue:0.834 alpha:1.000]];
    viewPulse.layer.cornerRadius = viewPulse.frame.size.width / 2;
    viewPulse.clipsToBounds = YES;
    viewPulse.layer.masksToBounds = YES;
    viewPulse.layer.borderColor = [UIColor colorWithRed:0.111 green:0.500 blue:0.839 alpha:1.000].CGColor;
    viewPulse.layer.borderWidth = 1.0;
    [self.view addSubview:viewPulse];
    
    CGRect frameSmall   = viewPulse.frame;
    CGRect frameBig     = viewPulse.frame;
    CGRect frameDefault = viewPulse.frame;
    // Frame Small
    {
        int sizeH = frameSmall.size.height * 0.15;
        int sizeW = frameSmall.size.width  * 0.15;
        frameSmall.size.height -= sizeH;
        frameSmall.size.width  -= sizeW;
        frameSmall.origin.x    += (sizeW / 2);
        frameSmall.origin.y    += (sizeH / 2);
    }
    // Frame Big
    {
        int sizeH = frameBig.size.height * 0.15;
        int sizeW = frameBig.size.width  * 0.15;
        frameBig.size.height += sizeH;
        frameBig.size.width  += sizeW;
        frameBig.origin.x    -= (sizeW / 2);
        frameBig.origin.y    -= (sizeH / 2);
    }
    
    [viewPulse setAlpha:0.5];
    [UIView animateWithDuration:0.1 animations: ^{
        viewPulse.frame = frameBig;
    } completion: ^(BOOL finished) {
        [UIView animateWithDuration:0.1 animations: ^{
            viewPulse.frame = frameSmall;
        } completion: ^(BOOL finished) {
            [UIView animateWithDuration:0.1 animations: ^{
                viewPulse.frame = frameDefault;
            } completion: ^(BOOL finished) {
                [viewPulse removeFromSuperview];
            }];
        }];
    }];
    
    
	[CalendarioMananger getDateinView:self.button onComplete: ^(NSDate *date) {
	    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Olha Aí" message:[NSString stringWithFormat:@"%@", date] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
	    [alert show];
	}];
}

@end
