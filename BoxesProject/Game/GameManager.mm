//
//  GameManager.m
//  BoxesProject
//
//  Created by Kirill Olenyov on 9/11/11.
//  Copyright 2011 House. All rights reserved.
//

#import "GameManager.h"

@implementation GameManager

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
        currentLevel = 1;
    }
    
    return self;
}

+ (void) game
{
    [[[GameManager alloc] init] startLevel];
}

- (void) startLevel
{
    BaseScene* scene = [SceneLoader loadScene:currentLevel];
    [scene setCallback:(id<BaseSceneCallback>)self];
    if([[CCDirector sharedDirector] runningScene] == nil) {
        [[CCDirector sharedDirector] runWithScene: [CCTransitionFade transitionWithDuration:0.5f scene:scene]];
    }
	[[CCDirector sharedDirector] replaceScene: [CCTransitionFade transitionWithDuration:0.5f scene:scene]];
}

- (void) fail
{
    
}

- (void) win:(BOOL)excellent
{
    
}

- (void) replayLevel
{
    [self startLevel];
}

- (void) startNextLevel
{
    currentLevel++;
    if(currentLevel > 3) {
        currentLevel = 1;
    }
    [self startLevel];
}

- (void) quitToMenu
{
    
}

@end
