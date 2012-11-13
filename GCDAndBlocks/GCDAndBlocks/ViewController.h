//
//  ViewController.h
//  GCDAndBlocks
//
//  Created by DOUGLAS STARNES on 8/26/12.
//  Copyright (c) 2012 Douglas Starnes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, weak) IBOutlet UITextView *textView;

- (IBAction)noThreads:(id)sender;
- (IBAction)oneQueue:(id)sender;
- (IBAction)mainQueue:(id)sender;
- (IBAction)groupedTasks:(id)sender;

@end
