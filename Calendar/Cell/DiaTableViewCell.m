//
//  DiaTableViewCell.m
//  Calendar
//
//  Created by Narlei Moreira on 04/02/15.
//  Copyright (c) 2015 NarleiMoreira. All rights reserved.
//

#import "DiaTableViewCell.h"
#import "CalendarioMananger.h"
@implementation DiaTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

-(void) setArrayDiasSemana:(NSArray *)arrayDiasSemana{
    _arrayDiasSemana = arrayDiasSemana;
    
    [self.labelDomingo setTitle:@"" forState:UIControlStateNormal];
    [self.labelSegunda setTitle:@"" forState:UIControlStateNormal];
    [self.labelTerca setTitle:@"" forState:UIControlStateNormal];
    [self.labelQuarta setTitle:@"" forState:UIControlStateNormal];
    [self.labelQuinta setTitle:@"" forState:UIControlStateNormal];
    [self.labelSexta setTitle:@"" forState:UIControlStateNormal];
    [self.labelSabado setTitle:@"" forState:UIControlStateNormal];
    [self.labelDomingo setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.labelSegunda setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.labelTerca setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.labelQuarta setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.labelQuinta setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.labelSexta setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.labelSabado setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [self.imageViewBallRed setHidden:YES];
    
    
    for (DiaCalendario *diaCalendario in arrayDiasSemana) {
        switch (diaCalendario.diaSemana) {
            case 1:
                [self setDiaInButton:diaCalendario button:self.labelDomingo];
                break;
            case 2:
                [self setDiaInButton:diaCalendario button:self.labelSegunda];
                break;
            case 3:
                [self setDiaInButton:diaCalendario button:self.labelTerca];
                break;
            case 4:
                [self setDiaInButton:diaCalendario button:self.labelQuarta];
                break;
            case 5:
                [self setDiaInButton:diaCalendario button:self.labelQuinta];
                break;
            case 6:
                [self setDiaInButton:diaCalendario button:self.labelSexta];
                break;
            case 7:
                [self setDiaInButton:diaCalendario button:self.labelSabado];
                break;
            default:
                break;
        }
        
        
    }
}

-(void) setDiaInButton:(DiaCalendario *)diaCalendario button:(UIButton *)button{
    [button setTitle:[NSString stringWithFormat:@"%d",diaCalendario.dia] forState:UIControlStateNormal];
    if (diaCalendario.hoje) {
        self.imageViewBallRed.frame = button.frame;
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal] ;
        [self.imageViewBallRed setHidden:NO];
    }
}


- (IBAction)diaPressionado:(UIButton *)sender {
    DiaCalendario *diaCalendario = [self.arrayDiasSemana objectAtIndex:0];
    
    NSLog(@"Dia %@/%d/%d",sender.titleLabel.text,[CalendarioMananger monthOfDate:diaCalendario.data],[CalendarioMananger yearOfDate:diaCalendario.data]);
}

@end
