//
//  BaseScene.m
//  BoxesProject
//
//  Created by Kirill Olenyov on 9/8/11.
//  Copyright 2011 House. All rights reserved.
//

#import "BaseScene.h"

@implementation BaseScene

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
        background = [BaseBackgroungLayer node];
        [self addChild:background z:0];
        
        foreground = [BaseForegroundLayer node];
        [foreground setCallback:(id<ForegroundCallback>)self];
        [self addChild:foreground z:2];
    }
    
    return self;
}

/*- (void) dealloc
{
    [level release];
    [super dealloc];
}*/

- (void) setBackground:(NSString*) file
{
    [background setBackground:file];
}

- (void) setLevel:(BaseLevelLayer*) newLevel
{
    if(level != nil) {
        [level release];
    }
    level = newLevel;
    [level setCallback:(id<LevelCallback>)self];
    [self addChild:level z:1];
    
    totalBadBlocks = [level getBadBlockCount];
    totalGoodBlocks = [level getGoodBlockCount];
}

int scoretemp; //TODO: should removed, scoremanager is not implemented yet
- (void)newScore: (int)score; //TODO: Remove this callback
{
    scoretemp +=score;
    [foreground setScore:scoretemp];
}

- (void)gameObjectFell:(int)gameObjectID
{
    if(gameObjectID == GOOD_BLOCK_ID) {
        [level fail];
        [foreground fail];
        [delegate fail];
    }
    
    int currentGoodBlocks = [level getGoodBlockCount];
    int currentBadBlocks = [level getBadBlockCount];
    if (currentBadBlocks <= 0) {
        BOOL exelent = NO;
        if (currentGoodBlocks == totalGoodBlocks) {
            exelent = YES;
        }
        [level win:exelent];
        [foreground win:exelent];
        [delegate win:exelent];
    }
}

- (void)gameObjectsContactID1:(int)id1 andID2:(int)id2
{
    
}
         
- (void)newMissleSelected: (int)tag
{
    [level setActiveMissle:tag];
}

- (void) replayMenuSelected
{
    [delegate replayLevel];
}

- (void) nextLevelMenuSelected
{
    [delegate startNextLevel];
}

- (void) quitToMenuSelected
{
    [delegate quitToMenu];
}

- (void) setCallback:(id<BaseSceneCallback>) callback
{
    delegate = callback;
}

@end
