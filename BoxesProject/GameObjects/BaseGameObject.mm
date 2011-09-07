//
//  BaseGameObject.m
//  BoxesProject
//
//  Created by Kirill Olenyov on 9/7/11.
//  Copyright 2011 House. All rights reserved.
//

#import "BaseGameObject.h"

@implementation BaseGameObject

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
    self = [self init];
    if (self) {
        // Initialization code here.
        self->position = p;
        self->angle = a;
    }
    
    return self;
}

+ (id)objectWithPosition:(CGPoint) p andWithAngle:(float) a
{
    return [[BaseGameObject alloc] initWithPosition:p andWithAngle:a];
}

- (void) makeObjectWithLayer:(CCLayer*) layer andWorld:(b2World*) world
{
    [self makeGraphicComponent:layer];
    [self makePhysicComponent:world];
}

- (void) makeGraphicComponent:(CCLayer*) layer
{
    if (imagepath == nil) {
        return;
    }
    sprite = [CCSprite spriteWithFile: imagepath];
    sprite.position = position;
    sprite.rotation = -1 * CC_RADIANS_TO_DEGREES(angle);
    [layer addChild:sprite];
}

- (void) makePhysicComponent:(b2World*) world
{
    
}

- (CCSprite*) getSprite
{
    return sprite;
}

- (b2Body*) getBody
{
    return body;
}

- (NSString*) getImagePath
{
    return imagepath;
}

- (void) updatePosition
{
    if(body != nil) {
        position = ccp(body->GetPosition().x * PTM_RATIO, body->GetPosition().y * PTM_RATIO);
        if(sprite != nil) {
            sprite.position = position;
            sprite.rotation = -1 * CC_RADIANS_TO_DEGREES(body->GetAngle());
        }
    }
}

@end
