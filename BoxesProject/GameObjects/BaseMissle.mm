//
//  BaseMissle.m
//  BoxesProject
//
//  Created by Kirill Olenyov on 9/7/11.
//  Copyright 2011 House. All rights reserved.
//

#import "BaseMissle.h"

@implementation BaseMissle

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
        gameObjectID = MISSLE_ID;
    }
    
    return self;
}

- (void) makePhysicComponent:(b2World*) world
{
    [super makePhysicComponent:world];
    
    b2CircleShape dynamicCircle;
    dynamicCircle.m_radius = 0.5f;
    if(sprite != nil) {
        dynamicCircle.m_radius = 0.5f*[sprite boundingBox].size.width/PTM_RATIO;
    }
	
	b2FixtureDef fixtureDef;
	fixtureDef.shape = &dynamicCircle;	
	fixtureDef.density = 3.0f;
	fixtureDef.friction = 0.2f;
    fixtureDef.restitution = 0.4f;
	body->CreateFixture(&fixtureDef);
}

- (float) getForceValue
{
    return forceAddValue;
}

@end
