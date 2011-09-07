//
//  BaseGameObject.h
//  BoxesProject
//
//  Created by Kirill Olenyov on 9/7/11.
//  Copyright 2011 House. All rights reserved.
//

#import "cocos2d.h"
#import "Box2D.h"
#import <Foundation/Foundation.h>

#define PTM_RATIO 32

@interface BaseGameObject : NSObject
{
    @protected
    CGPoint position;
    float angle;
    NSString* imagepath;
    CCSprite* sprite;
    b2Body* body;
}

- (id)initWithPosition:(CGPoint) p andWithAngle:(float) a;
+ (id) objectWithPosition:(CGPoint) p andWithAngle:(float) a;
- (void) makeObjectWithLayer:(CCLayer*) layer andWorld:(b2World*) world; 
- (void) makeGraphicComponent:(CCLayer*) layer;
- (void) makePhysicComponent:(b2World*) world;
- (CCSprite*) getSprite;
- (b2Body*) getBody;
- (NSString*) getImagePath;
- (void) updatePosition;
@end
