//
//  DiaCalendario.h
//  Calendar
//
//  Created by Narlei Moreira on 04/02/15.
//  Copyright (c) 2015 NarleiMoreira. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DiaCalendario : NSObject
@property (nonatomic,strong) NSDate *data;
@property (nonatomic)        int     dia;
@property (nonatomic)        int     mes;
@property (nonatomic)        BOOL    hoje;
@property (nonatomic)        int     diaSemana;
@end
