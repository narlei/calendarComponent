//
//  CalendarViewController.m
//  CalendarComposer
//
//  Created by Narlei Moreira on 05/06/15.
//  Copyright (c) 2015 Narlei Moreira. All rights reserved.
//

#import "CalendarViewController.h"
#import "CalendarioMananger.h"

@interface CalendarViewController ()

@end

@implementation CalendarViewController

- (void)viewDidLoad {
	[super viewDidLoad];
    self.defaultDate = (self.defaultDate == nil ? [NSDate date] : self.defaultDate);
    [self setaMes:[CalendarioMananger monthOfDate:self.defaultDate] andYear:[CalendarioMananger yearOfDate:self.defaultDate]];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

#pragma mark - Calendario
- (void)buttonDiaCalendarioPressed:(ButtonCalendar *)button {
	NSLog(@"%@", button.diaCalendario.data);
    [self custonBlockDate](button.diaCalendario.data);
    [self.popover dismissPopoverAnimated:YES];
}

- (void)setaMes:(int)pMonth andYear:(int)pYear {
	self.monthAtual = pMonth;
	self.yearAtual  = pYear;
	self.arrayMes = [CalendarioMananger getArrayFromMonth:self.monthAtual andYear:self.yearAtual];
	self.labelNomeMes.text = [NSString stringWithFormat:@"%@", [CalendarioMananger nameOfMonth:self.monthAtual]];
	self.labelAnoCalendario.text = [NSString stringWithFormat:@"%d", self.yearAtual];
	[self.tableViewCalendario reloadData];
}

- (IBAction)actionMesAnterior:(id)sender {
	if (self.monthAtual == 1) {
		self.monthAtual = 12;
		self.yearAtual -= 1;
		[self setaMes:12 andYear:self.yearAtual];
	}
	else {
		self.monthAtual -= 1;
		[self setaMes:self.monthAtual andYear:self.yearAtual];
	}
}

- (IBAction)actionProximoMes:(id)sender {
	if (self.monthAtual == 12) {
		self.monthAtual = 1;
		self.yearAtual += 1;
		[self setaMes:1 andYear:self.yearAtual];
	}
	else {
		self.monthAtual += 1;
		[self setaMes:self.monthAtual andYear:self.yearAtual];
	}
}

#pragma mark - TableView Delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *cell = [[UITableViewCell alloc] init];

	cell = [tableView dequeueReusableCellWithIdentifier:@"WeekCell"];
	DiaTableViewCell *sugestionCell = (DiaTableViewCell *)cell;
	sugestionCell.delegate = self;
	NSArray *arrayDiasSemana = [self.arrayMes objectAtIndex:indexPath.row];

	sugestionCell.arrayDiasSemana = arrayDiasSemana;

	return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return 6;
}

@end
