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

#import "BaseSceneCallback.h"

@interface BaseScene : CCScene
{
    BaseBackgroungLayer* background;
    BaseLevelLayer* level;
    BaseForegroundLayer* foreground;
    
    int totalGoodBlocks;
    int totalBadBlocks;
@private
    id<BaseSceneCallback> delegate;
}

- (void) setBackground:(NSString*) file;
- (void) setLevel:(BaseLevelLayer*) newLevel;

- (void)newScore: (int)score; //TODO: Remove this callback
- (void)gameObjectFell:(int)gameObjectID;
- (void)gameObjectsContactID1:(int)id1 andID2:(int)id2;
- (void)newMissleSelected: (int)tag;

- (void) setCallback:(id<BaseSceneCallback>) callback;
@end
