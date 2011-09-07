//
//  Obstacle.m
//  BoxesProject
//
//  Created by Kirill Olenyov on 9/7/11.
//  Copyright 2011 House. All rights reserved.
//

#import "Obstacle.h"

@implementation Obstacle

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (id)initWithPosition:(CGPoint) p andWithAngle:(float) a
{
    self = [super initWithPosition:p andWithAngle:a];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (void) makePhysicComponent:(b2World*) world
{
    [super makePhysicComponent:world];
    
    float width = 0.5f;
    float height = 0.5f;
    if(sprite != nil) {
        width = 0.5f*[sprite boundingBox].size.width/PTM_RATIO;
        height = 0.5f*[sprite boundingBox].size.height/PTM_RATIO;
    }
	
    b2PolygonShape groundBox;		
    groundBox.SetAsBox(width, height);
    body->CreateFixture(&groundBox,0);
    
    b2FixtureDef fixtureDef;
	fixtureDef.shape = &groundBox;	
	fixtureDef.density = 0.6f;
	fixtureDef.friction = 0.3f;
	body->CreateFixture(&fixtureDef);
}

@end
