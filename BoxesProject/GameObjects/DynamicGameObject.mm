//
//  DynamicGameObject.m
//  BoxesProject
//
//  Created by Kirill Olenyov on 9/7/11.
//  Copyright 2011 House. All rights reserved.
//

#import "DynamicGameObject.h"

@implementation DynamicGameObject

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
    b2BodyDef bodyDef;
	bodyDef.type = b2_dynamicBody;
	bodyDef.position.Set(position.x/PTM_RATIO, position.y/PTM_RATIO);
    bodyDef.angle = angle;
	bodyDef.userData = self;
    
	body = world->CreateBody(&bodyDef);
}

@end
