//
//  testViewController.m
//  Paper(week3)
//
//  Created by taabi on 7/5/14.
//  Copyright (c) 2014 taabi. All rights reserved.
//

#import "testViewController.h"

@interface testViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *newsScroll;

@end

@implementation testViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
       
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
     self.newsScroll.contentSize = CGSizeMake(320,1000);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
