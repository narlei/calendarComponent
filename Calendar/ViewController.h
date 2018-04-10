//
//  ViewController.h
//  Calendar
//
//  Created by Narlei Moreira on 04/02/15.
//  Copyright (c) 2015 NarleiMoreira. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic,strong) NSArray *arrayMes;
@property (weak, nonatomic) IBOutlet UILabel *labelNomeMes;
@property (nonatomic) int monthAtual;
@property (nonatomic) int yearAtual;
@property (weak, nonatomic) IBOutlet UITableView *tableViewCalendario;


- (IBAction)actionMesAnterior:(id)sender;
- (IBAction)actionProximoMes:(id)sender;




@end

