//
//  SceneLoader.h
//  BoxesProject
//
//  Created by Kirill Olenyov on 9/10/11.
//  Copyright 2011 House. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseBackgroungLayer.h"
#import "BaseLevelLayer.h"
#import "BaseForegroundLayer.h"
#import "RootViewController.h"
#import "BadBlock.h"
#import "GoodBlock.h"
#import "Obstacle.h"
#import "Bomb.h"
#import "DynamicObstacle.h"
#import "BaseScene.h"

@interface SceneLoader : NSObject
{
    
}

+ (BaseScene*) loadScene:(int)scene_id;
@end
