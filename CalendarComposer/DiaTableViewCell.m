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

- (void)setArrayDiasSemana:(NSArray *)arrayDiasSemana {
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

- (void)setDiaInButton:(DiaCalendario *)diaCalendario button:(ButtonCalendar *)button {
	[button setTitle:[NSString stringWithFormat:@"%d", diaCalendario.dia] forState:UIControlStateNormal];
	button.diaCalendario = diaCalendario;
	if (diaCalendario.hoje) {
		self.imageViewBallRed.frame = button.frame;
		[button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
		[self.imageViewBallRed setHidden:NO];
	}
	else {
		[button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
	}
}

- (IBAction)diaPressionado:(ButtonCalendar *)sender {
//    DiaCalendario *diaCalendario = [self.arrayDiasSemana objectAtIndex:0];
	UIView *viewPulse = [[UIView alloc] initWithFrame:sender.frame];
	[viewPulse setAlpha:0];
	[viewPulse setBackgroundColor:[UIColor colorWithRed:0.153 green:0.742 blue:0.834 alpha:1.000]];
	viewPulse.layer.cornerRadius = viewPulse.frame.size.width / 2;
	viewPulse.clipsToBounds = YES;
	viewPulse.layer.masksToBounds = YES;
	viewPulse.layer.borderColor = [UIColor colorWithRed:0.111 green:0.500 blue:0.839 alpha:1.000].CGColor;
	viewPulse.layer.borderWidth = 1.0;
	[self addSubview:viewPulse];


	CGRect frameDefault = viewPulse.frame;
	// Frame Default
	{
		int sizeH = frameDefault.size.height * 0.1;
		int sizeW = frameDefault.size.width  * 0.1;
		frameDefault.size.height -= sizeH;
		frameDefault.size.width  -= sizeW;
		frameDefault.origin.x    += (sizeW / 2);
		frameDefault.origin.y    += (sizeH / 2);
	}
	CGRect frameSmall   = frameDefault;

	// Frame Small
	{
		int sizeH = frameSmall.size.height * 0.2;
		int sizeW = frameSmall.size.width  * 0.2;
		frameSmall.size.height -= sizeH;
		frameSmall.size.width  -= sizeW;
		frameSmall.origin.x    += (sizeW / 2);
		frameSmall.origin.y    += (sizeH / 2);
	}
	CGRect frameBig     = frameDefault;
	// Frame Big
	{
		int sizeH = frameBig.size.height * 0.1;
		int sizeW = frameBig.size.width  * 0.1;
		frameBig.size.height += sizeH;
		frameBig.size.width  += sizeW;
		frameBig.origin.x    -= (sizeW / 2);
		frameBig.origin.y    -= (sizeH / 2);
	}

	[viewPulse setAlpha:0.5];
	[UIView animateWithDuration:0.12 animations: ^{
	    viewPulse.frame = frameBig;
	    viewPulse.layer.cornerRadius = viewPulse.frame.size.width / 2;
	    viewPulse.clipsToBounds = YES;
	    viewPulse.layer.masksToBounds = YES;
	} completion: ^(BOOL finished) {
	    [UIView animateWithDuration:0.12 animations: ^{
	        viewPulse.frame = frameSmall;
	        viewPulse.layer.cornerRadius = viewPulse.frame.size.width / 2;
	        viewPulse.clipsToBounds = YES;
	        viewPulse.layer.masksToBounds = YES;
		} completion: ^(BOOL finished) {
	        [UIView animateWithDuration:0.12 animations: ^{
	            viewPulse.frame = frameDefault;
	            viewPulse.layer.cornerRadius = viewPulse.frame.size.width / 2;
	            viewPulse.clipsToBounds = YES;
	            viewPulse.layer.masksToBounds = YES;
			} completion: ^(BOOL finished) {
	            [viewPulse removeFromSuperview];
	            [self.delegate buttonDiaCalendarioPressed:sender];
			}];
		}];
	}];
}

@end
