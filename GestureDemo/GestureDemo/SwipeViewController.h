//
//  SwipeViewController.h
//  GestureDemo
//
//  Created by DOUGLAS STARNES on 8/28/12.
//  Copyright (c) 2012 Douglas Starnes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SwipeViewController : UIViewController <UIGestureRecognizerDelegate>

@property (nonatomic, weak) IBOutlet UILabel *swiped;
@property (nonatomic, weak) IBOutlet UILabel *direction;

@end
