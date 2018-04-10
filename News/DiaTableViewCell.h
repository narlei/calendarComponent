//
//  DiaTableViewCell.h
//  Calendar
//
//  Created by Narlei Moreira on 04/02/15.
//  Copyright (c) 2015 NarleiMoreira. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DiaCalendario.h"
#import "ButtonCalendar.h"
@class DiaTableViewCell;

@protocol DiaTableViewCellDelegate <NSObject>

-(void) buttonDiaCalendarioPressed:(ButtonCalendar *) button;

@optional

@end




@interface DiaTableViewCell : UITableViewCell

@property (nonatomic, readwrite, weak) id <DiaTableViewCellDelegate> delegate;
@property (nonatomic,strong) NSArray *arrayDiasSemana;
@property (weak, nonatomic) IBOutlet ButtonCalendar *labelDomingo;
@property (weak, nonatomic) IBOutlet ButtonCalendar *labelSegunda;
@property (weak, nonatomic) IBOutlet ButtonCalendar *labelTerca;
@property (weak, nonatomic) IBOutlet ButtonCalendar *labelQuarta;
@property (weak, nonatomic) IBOutlet ButtonCalendar *labelQuinta;
@property (weak, nonatomic) IBOutlet ButtonCalendar *labelSexta;
@property (weak, nonatomic) IBOutlet ButtonCalendar *labelSabado;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewBallRed;


- (IBAction)diaPressionado:(ButtonCalendar *)sender;
@end