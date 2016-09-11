//
//  InfoViewController.m
//  PhillyFoodFinderMobile
//
//  Created by Krishna Bharathala on 9/10/16.
//  Copyright © 2016 Krishna Bharathala. All rights reserved.
//

#import "InfoViewController.h"

@interface InfoViewController ()

@end

@implementation InfoViewController

- (id)init {
    self = [super init];
    if (self) {
        self.title = @"About Us";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat width = self.view.frame.size.width - 32;
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] init];
    barButton.title = @"Back";
    self.navigationController.navigationBar.topItem.backBarButtonItem = barButton;
    
    UIScrollView* scrollView =
        [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    scrollView.backgroundColor = [UIColor whiteColor];
    scrollView.scrollEnabled = YES;
    scrollView.showsVerticalScrollIndicator = YES;
    scrollView.contentSize = CGSizeMake(self.view.bounds.size.width, self.view.bounds.size.height * 3);
    [self.view addSubview:scrollView];
    
    UILabel *infoLabel = [[UILabel alloc] initWithFrame:CGRectMake(16, 16, width, 0)];
    infoLabel.text = @"Nearly 22% of Philadelphians are food insecure, meaning they are unsure of where their next meal is coming from. Hunger exists in our neighborhoods because low-income families are forced to choose between paying rising rent, utility and medical bills and buying food. \n\nPeople facing food insecurity in this city are making difficult choices everyday that affect their ability to thrive. When forced to stretch food dollars, families often purchase cheaper, unhealthier foods to get their children through the day and stave off the feeling of hunger. Many food-insecure seniors are choosing between buying food and paying for medicine, and may skip meals throughout the day. The consequences of these choices include malnutrition, obesity, mental health concerns, a weakened immune system, and a reduced ability to pay attention in school. \n\nBased on this knowledge, the Philadelphia Food Policy Advisory Council's Anti-Hunger Subcommittee identified the need for a food resources toolkit that consolidated information about how to get affordable, healthy food in Philadelphia. The subcommittee members gathered and compiled reliable information about different types of food resources for a project now known as Philly Food Finder. This website, along with the printed guides that will be available soon, will help Philadelphians to: \n";
    infoLabel.numberOfLines = 0;
    [infoLabel sizeToFit];
    [scrollView addSubview:infoLabel];
    
    CGRect contentRect = CGRectZero;
    for (UIView *view in scrollView.subviews) {
        contentRect = CGRectUnion(contentRect, view.frame);
    }
    scrollView.contentSize = contentRect.size;
    
}

- (void) back {
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}


@end
