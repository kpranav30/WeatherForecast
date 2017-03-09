//
//  ViewController.m
//  WeatherForecast
//
//  Created by Pranav on 09/03/17.
//  Copyright © 2017 Pranav. All rights reserved.
//

#import "ViewController.h"
#import "TempDetailsTableViewCell.h"
#import "WeatherForcastFetcher.h"
#import "WeatherReport.h"
#import "WeatherRecord.h"

#import <CoreLocation/CoreLocation.h>

@interface ViewController ()<WeatherForecastFetcherDelegate>
{
    WeatherForcastFetcher *dataFecther;
    WeatherReport *completeReport;
    NSArray *tableDataSrouce;
    
    CLLocationManager *locationManager;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self initialiseLocationManager];
    [self initialiseCellNib];
    [self fecthData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Data fetcher

-(void)initialiseLocationManager
{
    locationManager = [[CLLocationManager alloc] init];
    locationManager.distanceFilter = kCLDistanceFilterNone;
    locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters;
    [locationManager startUpdatingLocation];
}

-(void)fecthData
{
    dataFecther = [[WeatherForcastFetcher alloc] init];
    dataFecther.delegate = self;
    dataFecther.latitude = [[NSString alloc] initWithFormat:@"%f",locationManager.location.coordinate.latitude];
    dataFecther.longitude = [[NSString alloc] initWithFormat:@"%f",locationManager.location.coordinate.longitude];
    
    [dataFecther fetchWeatherForecast];
}

#pragma mark - UI Helper methods

-(void)initialiseCellNib
{
    [self.weatherDetailsTable registerNib:[UINib nibWithNibName:@"TempDetailsTableViewCell" bundle:nil] forCellReuseIdentifier:@"TempDetailsTableViewCell"];
}

-(NSString *)getDateForUI:(NSString *)dateFromData
{
    NSMutableArray *dateArray = [[NSMutableArray alloc] initWithArray:[dateFromData componentsSeparatedByString:@"-"]];
    [dateArray removeObjectAtIndex:0];
    NSString *returnDate = [dateArray componentsJoinedByString:@"-"];
    return returnDate;
}

-(NSString *)appendWeatherDetails:(WeatherRecord *)record
{
    NSString *weatherDetails = [[NSString alloc] initWithFormat:@"%@, %@, %@, %@",record.humidity,record.temp,record.cloudiness,record.weatherDesc];
    return weatherDetails;
}

-(void)setDataOnUI
{
    self.cityName.text = completeReport.cityName;
    self.dateLabel.text = ((WeatherRecord *)[completeReport.day1Report objectAtIndex:0]).date;
    self.tempLabel.text = ((WeatherRecord *)[completeReport.day1Report objectAtIndex:0]).temp;
    self.weatherConditionLabel.text = ((WeatherRecord *)[completeReport.day1Report objectAtIndex:0]).weatherDesc;
    
    
    [self.day1Button setTitle:[self getDateForUI:((WeatherRecord *)[completeReport.day1Report objectAtIndex:0]).date] forState:UIControlStateNormal];
    [self.day2Button setTitle:[self getDateForUI:((WeatherRecord *)[completeReport.day2Report objectAtIndex:0]).date] forState:UIControlStateNormal];
    [self.day3Button setTitle:[self getDateForUI:((WeatherRecord *)[completeReport.day3Report objectAtIndex:0]).date] forState:UIControlStateNormal];
    [self.day4Button setTitle:[self getDateForUI:((WeatherRecord *)[completeReport.day4Report objectAtIndex:0]).date] forState:UIControlStateNormal];
    [self.day5Button setTitle:[self getDateForUI:((WeatherRecord *)[completeReport.day5Report objectAtIndex:0]).date] forState:UIControlStateNormal];
    
    tableDataSrouce = completeReport.day1Report;
    [self.weatherDetailsTable reloadData];
}

#pragma mark - Button actions

-(IBAction)day1Selected:(id)sender
{
    tableDataSrouce = completeReport.day1Report;
    [self.weatherDetailsTable reloadData];
}

-(IBAction)day2Selected:(id)sender
{
    tableDataSrouce = completeReport.day2Report;
    [self.weatherDetailsTable reloadData];
}

-(IBAction)day3Selected:(id)sender
{
    tableDataSrouce = completeReport.day3Report;
    [self.weatherDetailsTable reloadData];
}

-(IBAction)day4Selected:(id)sender
{
    tableDataSrouce = completeReport.day4Report;
    [self.weatherDetailsTable reloadData];
}

-(IBAction)day5Selected:(id)sender
{
    tableDataSrouce = completeReport.day5Report;
    [self.weatherDetailsTable reloadData];
}

#pragma mark - UITableViewDataSource methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return tableDataSrouce.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TempDetailsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TempDetailsTableViewCell"];
    cell.timeLabel.text = ((WeatherRecord *)[tableDataSrouce objectAtIndex:indexPath.row]).time;
    cell.weatherDetailsLabel.text = [self appendWeatherDetails:((WeatherRecord *)[tableDataSrouce objectAtIndex:indexPath.row])];
    return cell;
}

#pragma mark - UITableViewDelegate methods

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 74.0;
}

#pragma mark - Data fetcher delegate methods

-(void)weatherDataFetched:(id)data
{
    completeReport = (WeatherReport *)data;
    [self performSelectorOnMainThread:@selector(setDataOnUI) withObject:nil waitUntilDone:YES];
}

-(void)weatherDataFetchFailed:(NSString *)errorDesc
{
    NSLog(@"%@",errorDesc);
}

@end
