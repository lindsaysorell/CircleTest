//
//  C4WorkSpace.m
//  CircleTest
//
//  Created by Lindsay Sorell on 12-05-07.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "C4WorkSpace.h"
#import "GestureMovie.h"

@implementation C4WorkSpace
C4Movie *background;

-(void)setup {
    
    background = [C4Movie movieNamed:@"Ocean6.mp4"];
    background.center = CGPointMake(300, 500);
    background.transform = CGAffineTransformMakeScale(2, 2);
    //background.transform = CGAffineTransformMakeRotation(0.56);
    background.loops = YES;
    [background sizeToFit];
    [self.canvas addMovie:background];
    
    GestureMovie *newMovie = [GestureMovie movieNamed:@"Ocean6.mp4"];
    newMovie.center = CGPointMake(280, 900);
    newMovie.loops = YES;
    newMovie.transform = CGAffineTransformMakeScale(0.3, 0.3);
    newMovie.alpha = 0.05;
    //newMovie = [[UIColor alloc] initWithRed:0.0 green:0.0 blue:0.0 alpha:0.0];
    //newMovie.transform = CGAffineTransformMakeRotation(3.15);
    [self.canvas addMovie:newMovie];
    
    //GestureShape *g = [GestureShape new];
    //[g ellipse:CGRectMake(284, 412, 200, 200)];
    //[self.canvas addShape:newMovie];
}

@end
