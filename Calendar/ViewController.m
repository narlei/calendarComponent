//
//  ViewController.m
//  Calendar
//
//  Created by Narlei Moreira on 04/02/15.
//  Copyright (c) 2015 NarleiMoreira. All rights reserved.
//

#import "ViewController.h"
#import "CalendarioMananger.h"
#import "DiaTableViewCell.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setaMes:[CalendarioMananger monthOfDate:[NSDate date]] andYear:[CalendarioMananger yearOfDate:[NSDate date]]];
}

-(void) setaMes:(int) pMonth andYear:(int) pYear{
    self.monthAtual = pMonth;
    self.yearAtual  = pYear;
    self.arrayMes = [CalendarioMananger getArrayFromMonth:self.monthAtual andYear:self.yearAtual];
    self.labelNomeMes.text =[NSString stringWithFormat:@"%@ %d", [CalendarioMananger nameOfMonth:self.monthAtual],self.yearAtual];
    [self.tableViewCalendario reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    cell = [tableView dequeueReusableCellWithIdentifier:@"WeekCell"];
    DiaTableViewCell *sugestionCell = (DiaTableViewCell *) cell;
    
    NSArray *arrayDiasSemana = [self.arrayMes objectAtIndex:indexPath.row];
    
    sugestionCell.arrayDiasSemana = arrayDiasSemana;
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 6;
}


- (IBAction)actionMesAnterior:(id)sender {
    if (self.monthAtual==1) {
        self.monthAtual = 12;
        self.yearAtual -= 1;
        [self setaMes:12 andYear:self.yearAtual];
    }else{
        self.monthAtual-=1;
        [self setaMes:self.monthAtual andYear:self.yearAtual];
    }
}

- (IBAction)actionProximoMes:(id)sender {
    if (self.monthAtual==12) {
        self.monthAtual = 1;
        self.yearAtual += 1;
        [self setaMes:1 andYear:self.yearAtual];
    }else{
        self.monthAtual+=1;
        [self setaMes:self.monthAtual andYear:self.yearAtual];
    }
}


@end
