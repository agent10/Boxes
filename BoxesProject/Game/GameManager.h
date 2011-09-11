//
//  GameManager.h
//  BoxesProject
//
//  Created by Kirill Olenyov on 9/11/11.
//  Copyright 2011 House. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SceneLoader.h"
#import "BaseSceneCallback.h"

@interface GameManager : NSObject
{
    int currentLevel;
}

+ (void) game;

- (void) fail;
- (void) win:(BOOL)excellent;
- (void) replayLevel;
- (void) startNextLevel;
- (void) quitToMenu;
- (void) startLevel;

@end
