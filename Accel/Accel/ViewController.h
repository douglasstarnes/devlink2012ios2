//
//  ViewController.h
//  Accel
//
//  Created by DOUGLAS STARNES on 8/23/12.
//  Copyright (c) 2012 Douglas Starnes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>

@class CircleView;

@interface ViewController : UIViewController

@property (nonatomic, strong) CMMotionManager *cmm;
@property (nonatomic, strong) CircleView *circle;

@end
