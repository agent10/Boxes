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
            [layer addGameObject:[[Obstacle alloc] initWithPosition:ccp(350,60) andWithAngle:0.0f]];
            [layer addGameObject:[[BadBlock alloc] initWithPosition:ccp(350,125) andWithAngle:0.0f]];
            [layer addGameObject:[[BadBlock alloc] initWithPosition:ccp(350,200) andWithAngle:0.0f]];
            [layer addGameObject:[[BadBlock alloc] initWithPosition:ccp(350,265) andWithAngle:0.0f]];
            
            [newScene setLevel:layer];
            break;
        }

        case 2: {
            newScene = [BaseScene node];
            [newScene setBackground:@"backgroundtemp.png"];
            
            BaseLevelLayer* layer = [BaseLevelLayer node];
            [layer setGunArea:ccp(80,150) radius:nil];
            [layer addGameObject:[[Obstacle alloc] initWithPosition:ccp(350,60) andWithAngle:0.0f]];
            [layer addGameObject:[[GoodBlock alloc] initWithPosition:ccp(400,125) andWithAngle:0.0f]];
            [layer addGameObject:[[GoodBlock alloc] initWithPosition:ccp(300,125) andWithAngle:0.0f]];
            [layer addGameObject:[[BadBlock alloc] initWithPosition:ccp(310,200) andWithAngle:0.0f]];
            [layer addGameObject:[[BadBlock alloc] initWithPosition:ccp(390,205) andWithAngle:0.0f]];
            
            [newScene setLevel:layer];
            break;
        }
        case 3: {
            newScene = [BaseScene node];
            [newScene setBackground:@"backgroundtemp.png"];
            
            BaseLevelLayer* layer = [BaseLevelLayer node];
            [layer setGunArea:ccp(80,150) radius:nil];
            [layer addGameObject:[[Obstacle alloc] initWithPosition:ccp(350,60) andWithAngle:0.0f]];
            [layer addGameObject:[[BadBlock alloc] initWithPosition:ccp(410,125) andWithAngle:0.0f]];
            [layer addGameObject:[[BadBlock alloc] initWithPosition:ccp(290,125) andWithAngle:0.0f]];
            [layer addGameObject:[[Bomb alloc] initWithPosition:ccp(350,125) andWithAngle:0.0f]];
   
            
            [newScene setLevel:layer];
            break;
        }
            default:
            break;
    }
    return newScene;
}

@end
