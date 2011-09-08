//
//  BaseScene.h
//  BoxesProject
//
//  Created by Kirill Olenyov on 9/8/11.
//  Copyright 2011 House. All rights reserved.
//

#import "cocos2d.h"
#import "BaseBackgroungLayer.h"
#import "BaseLevelLayer.h"
#import "BaseForegroundLayer.h"

#import "LevelCallback.h"
#import "ForegroundCallback.h"

@interface BaseScene : CCScene
{
    BaseBackgroungLayer* background;
    BaseLevelLayer* level;
    BaseForegroundLayer* foreground;
}

- (void) setBackground:(NSString*) file;
- (void) setLevel:(BaseLevelLayer*) newLevel;

- (void)newScore: (int)score;
- (void)newMissleSelected: (int)tag;
@end
