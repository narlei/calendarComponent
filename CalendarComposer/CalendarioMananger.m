//
//  CalendarioMananger.m
//  Calendar
//
//  Created by Narlei Moreira on 04/02/15.
//  Copyright (c) 2015 NarleiMoreira. All rights reserved.
//

#import "CalendarioMananger.h"
#import "DiaCalendario.h"
#import "CalendarViewController.h"
@implementation CalendarioMananger

+ (NSArray *)getAllDayFromMonth:(int)pMonth andYear:(int)pYear {
	NSDate *today = [NSDate date];
	NSMutableArray *arrayAllDays = [NSMutableArray new];


	int daysOfMonth = [self countDaysOfMonth:pMonth andYear:pYear];
	for (int daysToAdd = 1; daysToAdd <= daysOfMonth; daysToAdd++) {
		//        NSDate *dayOneInCurrentMonth = [self firstDayOfMonth:pMonth];

		NSDate *diaGerado = [self dayOfMonthWithDay:daysToAdd andMonth:pMonth andYear:pYear];

		//        NSLog(@"%@",diaGerado);

		DiaCalendario *diaCalendario = [DiaCalendario new];
		diaCalendario.dia       = daysToAdd;
		diaCalendario.mes       = pMonth;
		diaCalendario.data      = diaGerado;
		diaCalendario.diaSemana = [self dayOfWeek:diaCalendario.data];
		diaCalendario.hoje      = NO;

		if ([self dayOfDate:today]   == [self dayOfDate:diaCalendario.data] &&
		    [self monthOfDate:today] == [self monthOfDate:diaCalendario.data] &&
		    [self yearOfDate:today]  == [self yearOfDate:diaCalendario.data]) {
			diaCalendario.hoje  = YES;
		}

		[arrayAllDays addObject:diaCalendario];
	}



	return arrayAllDays;
}

+ (NSArray *)getArrayFromMonth:(int)pMonth andYear:(int)pYear {
	NSArray *arrayDiasMes = [self getAllDayFromMonth:pMonth andYear:pYear];
	NSMutableArray *arrayMes = [NSMutableArray new];
	int totalDiasMes = [self countDaysOfMonth:pMonth andYear:pYear];

	int diaMes = 0;
	for (int semanaMes = 1; semanaMes <= 6; semanaMes++) {
		NSMutableArray *arraySemana = [NSMutableArray new];
		int diaSemana = 7;
		while (diaSemana > 0 && diaMes + 1 <= totalDiasMes) {
			diaSemana = 7;
			DiaCalendario *diaCalendario = [DiaCalendario new];
			diaCalendario = [arrayDiasMes objectAtIndex:diaMes];
			//            NSLog(@"%@",diaCalendario.data);

			diaSemana -= diaCalendario.diaSemana;
			[arraySemana addObject:diaCalendario];
			diaMes++;
		}
		[arrayMes addObject:arraySemana];
	}
	return arrayMes;
}

+ (int)countDaysOfMonth:(int)pMonth andYear:(int)pYear {
	NSDate *dayOneInCurrentMonth = [self firstDayOfMonth:pMonth andYear:pYear];


	NSCalendar *c = [NSCalendar currentCalendar];
	NSRange days = [c rangeOfUnit:NSCalendarUnitDay
	                       inUnit:NSCalendarUnitMonth
	                      forDate:dayOneInCurrentMonth];

	int daysOfMonth = (int)days.length;

	return daysOfMonth;
}

+ (NSDate *)dayOfMonthWithDay:(int)pDay andMonth:(int)pMonth andYear:(int)pYear {
	NSDate *today = [NSDate date];

	NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
	NSDateComponents *components = [gregorian components:(NSCalendarUnitEra | NSCalendarUnitYear | NSCalendarUnitMonth) fromDate:today];
	components.day   = pDay;
	components.month = pMonth;
	components.year = pYear;
	NSDate *dayOneInCurrentMonth = [gregorian dateFromComponents:components];

	return dayOneInCurrentMonth;
}

+ (NSDate *)firstDayOfMonth:(int)pMonth andYear:(int)pYear {
	NSDate *today = [NSDate date];

	NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
	NSDateComponents *components = [gregorian components:(NSCalendarUnitEra | NSCalendarUnitYear | NSCalendarUnitMonth) fromDate:today];
	components.day = 1;
	components.month = pMonth;
	components.year  = pYear;
	NSDate *dayOneInCurrentMonth = [gregorian dateFromComponents:components];

	return dayOneInCurrentMonth;
}

+ (int)dayOfWeek:(NSDate *)date {
	NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
	NSDateComponents *comps = [gregorian components:NSCalendarUnitWeekday fromDate:date];
	int weekday = (int)[comps weekday];
	return weekday;
}

+ (int)dayOfDate:(NSDate *)date {
	NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:date];
	return (int)[components day];
}

+ (int)monthOfDate:(NSDate *)date {
	NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:date];
	return (int)[components month];
}

+ (int)yearOfDate:(NSDate *)date {
	NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:date];
	return (int)[components year];
}

+ (NSString *)nameOfMonth:(int)pMonth {
	NSString *nomeMes = @"";
	switch (pMonth) {
		case 1:
			nomeMes = @"Janeiro";
			break;

		case 2:
			nomeMes = @"Fevereiro";
			break;

		case 3:
			nomeMes = @"Março";
			break;

		case 4:
			nomeMes = @"Abril";
			break;

		case 5:
			nomeMes = @"Maio";
			break;

		case 6:
			nomeMes = @"Junho";
			break;

		case 7:
			nomeMes = @"Julho";
			break;

		case 8:
			nomeMes = @"Agosto";
			break;

		case 9:
			nomeMes = @"Setembro";
			break;

		case 10:
			nomeMes = @"Outubro";
			break;

		case 11:
			nomeMes = @"Novembro";
			break;

		case 12:
			nomeMes = @"Dezembro";
			break;

		default:
			break;
	}
	return nomeMes;
}

- (NSString *)dayOfWeek:(NSDate *)date {
	NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
	NSDateComponents *comps = [gregorian components:NSCalendarUnitWeekday fromDate:date];
	int weekday = (int)[comps weekday];

	NSString *diaDaSemana = @"";
	switch (weekday) {
		case 1:
			diaDaSemana = @"Domingo";
			break;

		case 2:
			diaDaSemana = @"Segunda-feira";
			break;

		case 3:
			diaDaSemana = @"Terça-feira";
			break;

		case 4:
			diaDaSemana = @"Quarta-Feira";
			break;

		case 5:
			diaDaSemana = @"Quinta-Feira";
			break;

		case 6:
			diaDaSemana = @"Sexta-Feira";
			break;

		case 7:
			diaDaSemana = @"Sabado";
			break;

		default:

			break;
	}
	return diaDaSemana;
}

+ (void) getDateinView:(UIButton *)pButton onComplete:(void (^)(NSDate *date))onComplete  {
    [CalendarioMananger getDateinView:pButton defaultDate:nil onComplete:onComplete];
}

+ (void) getDateinView:(UIButton *)pButton defaultDate:(NSDate *)pDate onComplete:(void (^)(NSDate *date))onComplete  {
    UIPopoverController *popover;
    CalendarViewController *viewController = [[UIStoryboard storyboardWithName:@"Calendar" bundle:nil] instantiateInitialViewController];
    popover = [[UIPopoverController alloc] initWithContentViewController:viewController];
    viewController.popover = popover;
    viewController.custonBlockDate = onComplete;
    viewController.defaultDate = pDate;
    
    viewController.preferredContentSize = CGSizeMake(320, 250);
    [popover presentPopoverFromRect:CGRectMake(0, 0, 50, 30) inView:pButton permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
}

@end
