//
//  CannonZone.m
//  BoxesProject
//
//  Created by Kirill Olenyov on 9/4/11.
//  Copyright 2011 House. All rights reserved.
//

#import "CannonZone.h"

@implementation CannonZone

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
        [[CCTouchDispatcher sharedDispatcher] addStandardDelegate:(id<CCStandardTouchDelegate>)self priority:0];
        
        cannon = [CCSprite spriteWithFile: @"cannon.png"];
        [cannon setVisible:NO];
        [self addChild:cannon];
    }
    
    return self;
}

- (void) dealloc
{
    //[cannon release];
    
	// don't forget to call "super dealloc"
	[super dealloc];
}

- (void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    for( UITouch *touch in touches ) {
        CGPoint location = [self convertTouchToNodeSpace:touch];
        if (!CGRectContainsPoint(self.boundingBox, [self convertToWorldSpace:location])) {
            return;
        }
        captioned = true;
        fpoint = location;
        [cannon setRotation:cannon.rotation];
        [cannon setPosition:location];
        [cannon setVisible:YES];
		
	}
}

- (void)ccTouchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    if(!captioned)
        return;
    for( UITouch *touch in touches ) {
        CGPoint location = [self convertTouchToNodeSpace: touch];
        GLfloat angle = 180 + (atan2(location.y - fpoint.y, location.x - fpoint.x) * (180/3.14));
        [cannon setRotation:-angle];
    }
}

- (void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [cannon setVisible:NO];
    if(!captioned)
    {
        return;
    }
    captioned = NO;
	for( UITouch *touch in touches ) {
		CGPoint location = [touch locationInView: [touch view]];
		
		location = [[CCDirector sharedDirector] convertToGL: location];
        float forcetemp = 13; //TODO: Change
        float a = forcetemp * sin((90 + cannon.rotation)*3.14/180);
        float b = forcetemp * cos((90 + cannon.rotation)*3.14/180);
        [delegate fire:[self convertToWorldSpace:fpoint] vec:ccp(a,b) force:150];
	}
}

- (void) setCallback:(id<CannonZoneCallback>) callback
{
    delegate = callback;
}

@end
