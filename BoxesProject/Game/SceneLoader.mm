//
//  SceneLoader.m
//  BoxesProject
//
//  Created by Kirill Olenyov on 9/10/11.
//  Copyright 2011 House. All rights reserved.
//

#import "SceneLoader.h"

@implementation SceneLoader

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

+ (BaseScene*) loadScene:(int)scene_id
{
    BaseScene* newScene = nil;
    switch (scene_id) {
        case 1: {
            newScene = [BaseScene node];
            [newScene setBackground:@"backgroundtemp.png"];
            
            BaseLevelLayer* layer = [BaseLevelLayer node];
            [layer setGunArea:ccp(80,130) radius:nil];
            [layer addGameObject:[[Obstacle alloc] initWithPosition:ccp(300,60) andWithAngle:0.0f]];
            [layer addGameObject:[[Obstacle alloc] initWithPosition:ccp(400,60) andWithAngle:0.0f]];
            [layer addGameObject:[[DynamicObstacle alloc] initWithPosition:ccp(320,100) andWithAngle:0.0f]];
            [layer addGameObject:[[BadBlock alloc] initWithPosition:ccp(300,250) andWithAngle:0.0f]];
            [layer addGameObject:[[GoodBlock alloc] initWithPosition:ccp(300,150) andWithAngle:0.0f]];
            
            [newScene setLevel:layer];
            break;
        }

        case 2: {
            newScene = [BaseScene node];
            [newScene setBackground:@"backgroundtemp.png"];
            
            BaseLevelLayer* layer = [BaseLevelLayer node];
            [layer setGunArea:ccp(80,130) radius:nil];
            [layer addGameObject:[[Obstacle alloc] initWithPosition:ccp(300,60) andWithAngle:0.0f]];
            [layer addGameObject:[[Obstacle alloc] initWithPosition:ccp(400,60) andWithAngle:0.0f]];
            [layer addGameObject:[[DynamicObstacle alloc] initWithPosition:ccp(320,100) andWithAngle:0.0f]];
            [layer addGameObject:[[Bomb alloc] initWithPosition:ccp(250,150) andWithAngle:0.0f]];
            [layer addGameObject:[[GoodBlock alloc] initWithPosition:ccp(300,350) andWithAngle:0.0f]];
            [layer addGameObject:[[BadBlock alloc] initWithPosition:ccp(300,250) andWithAngle:0.0f]];
            [layer addGameObject:[[GoodBlock alloc] initWithPosition:ccp(300,150) andWithAngle:0.0f]];
            
            [newScene setLevel:layer];
            break;
        }
            default:
            break;
    }
    return newScene;
}

@end
