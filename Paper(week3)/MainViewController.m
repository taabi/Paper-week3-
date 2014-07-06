//
//  MainViewController.m
//  Paper(week3)
//
//  Created by taabi on 7/5/14.
//  Copyright (c) 2014 taabi. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()
- (IBAction)onPanHeadline:(UIPanGestureRecognizer *)sender;
@property (weak, nonatomic) IBOutlet UIView *headlineView;
@property (weak, nonatomic) IBOutlet UIScrollView *newsScrollview;

@property (weak, nonatomic) IBOutlet UIImageView *menuImage;
@property (weak, nonatomic) IBOutlet UIImageView *newsImage;

@end
CGPoint distance;
@implementation MainViewController

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
    //white status bar
    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:NO];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    // Do any additional setup after loading the view from its nib.
    self.newsScrollview.contentSize = CGSizeMake(1450, 260);
    
    self.menuImage.alpha = 0.2;
    
   
    
    [UIView animateWithDuration:.4 delay:0.2 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.newsImage.center = CGPointMake(1446, self.newsImage.center.y);
    } completion: NULL];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onPanHeadline:(UIPanGestureRecognizer *)panGestureRecognizer {
    CGPoint location = [panGestureRecognizer locationInView:self.view];
    float pixels;
    //CGPoint velocity = [panGestureRecognizer velocityInView:self.view];
    
    
    
    if(panGestureRecognizer.state == UIGestureRecognizerStateBegan)
    {
        distance = location;
        //NSLog(@"Move Began: %@", NSStringFromCGPoint(distance));
         //NSLog(@"view position: %@", NSStringFromCGPoint(self.headlineView.center));
        
        
    }else if (panGestureRecognizer.state == UIGestureRecognizerStateChanged)
    {
       // NSLog(@"Moving: %@ , %@", NSStringFromCGPoint(location), NSStringFromCGPoint(velocity));
       
        
        pixels =location.y - distance.y;
        
        //NSLog(@"Distance: %@ ", NSStringFromCGPoint(distance));
        //NSLog(@"pixels moved: %f ", pixels);
        
        //main view moving
        if(self.headlineView.center.y > 283){
        self.headlineView.center = CGPointMake(self.headlineView.center.x, self.headlineView.center.y + pixels );
            
            [UIView animateWithDuration:.8 animations:^{
                self.menuImage.alpha = 1;
            }];
        }else{
            pixels = pixels/80;
            self.headlineView.center = CGPointMake(self.headlineView.center.x, self.headlineView.center.y + pixels );
            
        }
        
        // set distance 0 continously
        distance = location;
    }else if (panGestureRecognizer.state == UIGestureRecognizerStateEnded)
    {
        //NSLog(@"Move Ended");
        
        if(self.headlineView.center.y > 500){
            
            [UIView animateWithDuration:0.5 animations:^{
                self.headlineView.center = CGPointMake(self.headlineView.center.x, 810);
                
                [UIView animateWithDuration:.8 animations:^{
                    self.menuImage.alpha = 1;
                }];
            }];
            
        }else{
            [UIView animateWithDuration:0.5 animations:^{
                self.headlineView.center = CGPointMake(160, 284);
            }];
            
            [UIView animateWithDuration:.8 animations:^{
                self.menuImage.alpha = .2;
            }];
            
        }
    }
    
}
@end
