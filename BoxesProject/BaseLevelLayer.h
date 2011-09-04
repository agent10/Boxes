//
//  BaseLevelLayer.h
//  BoxesProject
//
//  Created by Kirill Olenyov on 9/3/11.
//  Copyright 2011 House. All rights reserved.
//

#import "cocos2d.h"
#import "Box2D.h"
#import "GLES-Render.h"
#import "CannonZone.h"

@interface BaseLevelLayer : CCLayer
{
    @protected
    b2World* world;
    GLESDebugDraw *m_debugDraw;
}

-(void) addEnemy: (NSString*)image location: (CGPoint)location angle: (float)angle;
-(void) addObstacle: (NSString*)image location: (CGPoint)location angle: (float)angle;
-(void) setGunArea:(CGPoint) location radius: (float)radius;
-(void) fire: (CGPoint)location vec: (CGPoint)vec force: (float)force;

@end
