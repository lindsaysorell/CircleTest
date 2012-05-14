//
//  GestureMovie.m
//  CircleTest
//
//  Created by Lindsay Sorell on 12-05-10.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GestureMovie.h"


@implementation GestureMovie {

/*- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}

@end
 */

//@implementation GestureShape {
    BOOL canMove;
    //BOOL visible;
}

-(id)init {
    self = [super init];
    if(self != nil) {
        [self setup];
    }
    return self;
}

-(void)setup {
    canMove = YES;
    C4Log(@"should setup");
//    [self addGesture:SWIPEUP name:@"swipeUpGesture" action:@"swipedUp"];
    [self addGesture:PAN name:@"panGesture" action:@"move:"];
    [self addGesture:TAP name:@"singleTapGesture" action:@"tap"];
    [self addGesture:LONGPRESS name:@"longPressGesture" action:@"longPress"];
}

//-(void)swipedUp {
//    C4Log(@"swiped Up");
//}

+(GestureMovie *)movieNamed:(NSString *)movieName {
    GestureMovie *m = [[GestureMovie alloc] initWithMovieName:movieName];
    [m setup];
    return m;
}


-(void)move:(id)sender {
    
    C4Log(@"++");
    if(canMove) {
        self.animationDuration = 0.4f;
        UIPanGestureRecognizer *pan = (UIPanGestureRecognizer *)sender;
        CGPoint panPoint = [pan translationInView:self];
        
        if(panPoint.x < 15) {
            self.center = CGPointMake(self.center.x+panPoint.x, self.center.y+panPoint.y);
        } else {
            canMove = YES;
            self.animationDuration = 3.0f;
            self.center = CGPointMake(280, 900);
        }
        [pan setTranslation:CGPointZero inView:self];
        
        if(panPoint.y < 1) {
            canMove = YES;
        }
        else {
            ; //do nothing
        }
//        if(panPoint.x > 5) {
//            canMove = NO;
//        }
        
    }
}
-(void)tap {
    C4Log(@"single tap");
    self.alpha = 1.0;
    self.animationDuration = 5.0f;

}

-(void)longPress {
    C4Log(@"long press");
    canMove = YES;
}

-(void)touchesBegan {
    C4Log(@"began");
}
       
-(void)touchesEnded {
    //canMove = YES;
    C4Log(@"ended");
    //self.alpha = 0.0;
    //self.animationDuration = 1.0f;
    //self.center = CGPointMake(280, 900);
}
@end