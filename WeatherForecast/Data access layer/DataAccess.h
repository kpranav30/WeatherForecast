//
//  DataAccess.h
//  WeatherForecast
//
//  Created by Pranav on 09/03/17.
//  Copyright © 2017 Pranav. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataAccessHelper.h"

@protocol DataAccessDelegate <NSObject>

-(void)dataAccessFailedWithError:(NSString *)errorDescp;
-(void)dataAccessSuccessful:(id)receivedDataModel;

@end

@interface DataAccess : NSObject

@property(nonatomic,strong)NSString *reqParams;
@property(nonatomic,weak)id<DataAccessDelegate> delegate;

-(void)fetchDataFor:(DataAceesType)reqType;
@end
