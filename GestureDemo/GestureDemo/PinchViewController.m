//
//  PinchViewController.m
//  GestureDemo
//
//  Created by DOUGLAS STARNES on 8/28/12.
//  Copyright (c) 2012 Douglas Starnes. All rights reserved.
//

#import "PinchViewController.h"

@interface PinchViewController ()

@end

@implementation PinchViewController

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
    UIPinchGestureRecognizer *recognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchDone:)];
    [self.view addGestureRecognizer:recognizer];
    self.pinched.text = @"";
    self.scaleMe.minimumFontSize = 8;
    self.scaleMe.adjustsFontSizeToFitWidth = YES;
    UIFont *font = [UIFont systemFontOfSize:100.0];
    [self.scaleMe setFont:font];
}

- (void)pinchDone:(UIPinchGestureRecognizer *)r
{
    if (r.state == UIGestureRecognizerStateBegan)
        self.pinched.text = @"PINCHED";
    if (r.state == UIGestureRecognizerStateChanged) {
        CGFloat scaleFactor = r.scale;
        NSLog(@"SCALE FACTOR: %f", scaleFactor);
        CGFloat w = 89.0 * scaleFactor;
        CGFloat h = self.scaleMe.frame.size.height;
        CGPoint currentCenter = self.scaleMe.center;
        self.scaleMe.frame = CGRectMake(self.scaleMe.frame.origin.x, self.scaleMe.frame.origin.y, w, h);
        self.scaleMe.center = currentCenter;
    }
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
