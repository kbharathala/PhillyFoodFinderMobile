//
//  ViewController.m
//  PhillyFoodFinderMobile
//
//  Created by Krishna Bharathala on 9/10/16.
//  Copyright © 2016 Krishna Bharathala. All rights reserved.
//

#import <MapKit/MapKit.h>
#import "ViewController.h"
#import "InfoViewController.h"


@interface ViewController () <CLLocationManagerDelegate, MKMapViewDelegate>

@property(nonatomic, strong) CLLocation *location;
@property(nonatomic, strong) MKMapView *mapView;
@property(strong, nonatomic) CLLocationManager *locationManager;

@end

@implementation ViewController

- (id)init {
    self = [super init];
    if (self) {
        self.title = @"Philly Food Finder";
    }
    return self;
}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.toolbarHidden = NO;
}

- (void) viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationController.toolbarHidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *infoButton = [UIButton buttonWithType:UIButtonTypeInfoDark];
    [infoButton addTarget:self
                   action:@selector(showInfoScreen)
         forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:infoButton];
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    [self.locationManager requestWhenInUseAuthorization];
    [self.locationManager startUpdatingLocation];
    
    self.mapView = [[MKMapView alloc] initWithFrame:self.view.frame];
    self.mapView.delegate = self;
    self.mapView.showsUserLocation = YES;
    [self.view addSubview:self.mapView];
    
    UIBarButtonItem *flexibleSpace =
        [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                      target:nil
                                                      action:nil];

    UIBarButtonItem *filterButton =
        [[UIBarButtonItem alloc] initWithTitle:@"Filter"
                                         style:UIBarButtonItemStyleDone
                                        target:self
                                        action:@selector(applyFilter)];
    
    NSArray *buttons = [NSArray arrayWithObjects: flexibleSpace, filterButton, nil];
    [self setToolbarItems:buttons];
    [self.navigationController.toolbar setTintColor:[UIColor blueColor]];
    
    
    
}

- (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize {
    // UIGraphicsBeginImageContext(newSize);
    // In next line, pass 0.0 to use the current device's pixel scaling factor (and thus account for Retina resolution).
    // Pass 1.0 to force exact pixel size.
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

- (void)showInfoScreen {
    InfoViewController *infoVC = [[InfoViewController alloc] init];
    [self.navigationController pushViewController:infoVC animated:YES];
}

- (void)applyFilter {
    NSLog(@"HIIIIIII");
}

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation {
    self.location = userLocation.location;
    
    MKCoordinateRegion mapRegion;
    mapRegion.center = mapView.userLocation.coordinate;
    mapRegion.span.latitudeDelta = 0.2;
    mapRegion.span.longitudeDelta = 0.2;
    [mapView setRegion:mapRegion animated:YES];
}


@end
