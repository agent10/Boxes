//
//  MissleType2.m
//  BoxesProject
//
//  Created by Kirill Olenyov on 9/9/11.
//  Copyright 2011 House. All rights reserved.
//

#import "MissleType2.h"

@implementation MissleType2

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
        forceAddValue = 2.0f;
    }
    
    return self;
}

- (id)initWithPosition:(CGPoint) p andWithAngle:(float) a
{
    self = [super initWithPosition:p andWithAngle:a];
    if (self) {
        // Initialization code here.
        imagepath = @"mis2.png";
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
