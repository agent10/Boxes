//
//  Missle.m
//  BoxesProject
//
//  Created by Kirill Olenyov on 9/7/11.
//  Copyright 2011 House. All rights reserved.
//

#import "Missle.h"

@implementation Missle

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
        forceAddValue = 1.0f;
    }
    
    return self;
}

- (id)initWithPosition:(CGPoint) p andWithAngle:(float) a
{
    self = [super initWithPosition:p andWithAngle:a];
    if (self) {
        // Initialization code here.
        imagepath = @"mis1.png";
    }
    
    return self;
}

- (void) makeGraphicComponent:(CCLayer*) layer
{
    if (imagepath == nil) {
        return;
    }
    sprite = [CCSprite spriteWithFile: imagepath];
    sprite.scale = 0.8f;
    sprite.position = position;
    sprite.rotation = -1 * CC_RADIANS_TO_DEGREES(angle);
    [layer addChild:sprite];
}

@end
