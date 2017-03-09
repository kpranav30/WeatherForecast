//
//  DataAccess.m
//  WeatherForecast
//
//  Created by Pranav on 09/03/17.
//  Copyright © 2017 Pranav. All rights reserved.
//

#import "DataAccess.h"

@implementation DataAccess

-(void)fetchDataFor:(DataAceesType)reqType
{
    
    NSString *urlString = [self getURL];
    NSURL *URL = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    __block DataAccess *weakSelf = self;
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request
                                            completionHandler:
                                  ^(NSData *data, NSURLResponse *response, NSError *error) {
                                      if (error == nil) {
                                          if (data!=nil) {
                                              NSError *jsonError = nil;
                                              NSDictionary *dataReceived = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
                                              [weakSelf updateDelegate:dataReceived];
                                          }
                                          else{
                                              [weakSelf updateDelegate:nil];
                                          }
                                      }else{
                                          [weakSelf updateDelegate:nil];
                                      }
                                  }];
    
    [task resume];
}

-(NSString *)getURL
{
    DataAccessHelper *helper = [[DataAccessHelper alloc] init];
    NSString *urlString = [helper urlStringForDataAccessType:DATA_ACCESS_TYPE_WEATHER_DATA];
    NSString *finalUrl = [[NSString alloc] initWithFormat:@"%@%@&units=metric&appid=e9d08234a929429601e5a933142adc5c",urlString,self.reqParams];
    return finalUrl;
}

-(void)updateDelegate:(id)dataReceived
{
    if (dataReceived != nil) {
        if (self.delegate != nil && [self.delegate conformsToProtocol:@protocol(DataAccessDelegate)] &&
            [self.delegate respondsToSelector:@selector(dataAccessSuccessful:)]) {
            [self.delegate dataAccessSuccessful:dataReceived];
        }
    }
    else{
        if (self.delegate != nil && [self.delegate conformsToProtocol:@protocol(DataAccessDelegate)] &&
            [self.delegate respondsToSelector:@selector(dataAccessFailedWithError:)]) {
            [self.delegate dataAccessFailedWithError:@"Failure at data access layer. Could be network failure or json parsing failure"];
        }
    }
}

@end
