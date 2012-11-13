//
//  main.m
//  BlocksTest
//
//  Created by DOUGLAS STARNES on 8/26/12.
//  Copyright (c) 2012 Douglas Starnes. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IntContainer : NSObject

@property (nonatomic, assign) int intvalue;

@end

@implementation IntContainer

-(id)initWithValue:(int)value
{
    if ((self = [super init]))
    {
        self.intvalue = value;
    }
    
    return self;
}

@end

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        NSArray *intContainerArray = [NSArray arrayWithObjects:
                                 [[IntContainer alloc] initWithValue:10],
                                 [[IntContainer alloc] initWithValue:4],
                                 [[IntContainer alloc] initWithValue:8],
                                 [[IntContainer alloc] initWithValue:1],
                                 [[IntContainer alloc] initWithValue:2],
                                 [[IntContainer alloc] initWithValue:0],
                                 [[IntContainer alloc] initWithValue:7],nil];
        
        NSArray *array = [intContainerArray sortedArrayUsingComparator:^(id obj1, id obj2){
            IntContainer *a = (IntContainer *)obj1;
            IntContainer *z = (IntContainer *)obj2;
            
            if (a.intvalue < z.intvalue) return (NSComparisonResult)NSOrderedAscending;
            if (a.intvalue > z.intvalue) return (NSComparisonResult)NSOrderedDescending;
            return (NSComparisonResult)NSOrderedSame;
        }];
        
        for (IntContainer *ic in array) {
            NSLog(@"%d\n", ic.intvalue);
        }
    }

    return 0;
}

