//
//  DiaTableViewCell.h
//  Calendar
//
//  Created by Narlei Moreira on 04/02/15.
//  Copyright (c) 2015 NarleiMoreira. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DiaCalendario.h"
@interface DiaTableViewCell : UITableViewCell
@property (nonatomic,strong) NSArray *arrayDiasSemana;

@property (weak, nonatomic) IBOutlet UIButton *labelDomingo;
@property (weak, nonatomic) IBOutlet UIButton *labelSegunda;
@property (weak, nonatomic) IBOutlet UIButton *labelTerca;
@property (weak, nonatomic) IBOutlet UIButton *labelQuarta;
@property (weak, nonatomic) IBOutlet UIButton *labelQuinta;
@property (weak, nonatomic) IBOutlet UIButton *labelSexta;
@property (weak, nonatomic) IBOutlet UIButton *labelSabado;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewBallRed;


- (IBAction)diaPressionado:(UIButton *)sender;


@end
