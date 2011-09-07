//
//  StaticGameObject.m
//  BoxesProject
//
//  Created by Kirill Olenyov on 9/7/11.
//  Copyright 2011 House. All rights reserved.
//

#import "StaticGameObject.h"

@implementation StaticGameObject

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (void) makePhysicComponent:(b2World*) world
{    
    b2BodyDef groundBodyDef;
    groundBodyDef.position.Set(position.x/PTM_RATIO, position.y/PTM_RATIO);
    groundBodyDef.angle = angle;
    
    body = world->CreateBody(&groundBodyDef);
}

@end
