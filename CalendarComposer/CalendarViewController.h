//
//  CalendarViewController.h
//  CalendarComposer
//
//  Created by Narlei Moreira on 05/06/15.
//  Copyright (c) 2015 Narlei Moreira. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DiaTableViewCell.h"

@class CalendarViewController;

@protocol CalendarViewControllerDelegate <NSObject>

// Metodos

@optional

@end



@interface CalendarViewController : UIViewController<DiaTableViewCellDelegate>
@property (nonatomic, readwrite, weak) id <CalendarViewControllerDelegate> delegate;
typedef void (^CustonBlockDate)(NSDate *date);
@property (nonatomic,strong) CustonBlockDate custonBlockDate ;

@property (weak, nonatomic) IBOutlet UITableView *tableViewCalendario;
@property (weak, nonatomic) IBOutlet UILabel *labelNomeMes;
@property (weak, nonatomic) IBOutlet UILabel *labelAnoCalendario;

@property (nonatomic, strong) UIPopoverController *popover;
@property (nonatomic,strong) NSArray *arrayMes;
@property (nonatomic,strong) NSDate* defaultDate ;

@property (nonatomic) int monthAtual;
@property (nonatomic) int yearAtual;

- (IBAction)actionMesAnterior:(id)sender;
- (IBAction)actionProximoMes:(id)sender;
@end
