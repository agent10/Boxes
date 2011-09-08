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
}

int scoretemp; //TODO: should removed, scoremanager is not implemented yet
- (void)newScore: (int)score;
{
    scoretemp +=score;
    [foreground setScore:scoretemp];
}
         
- (void)newMissleSelected: (int)tag
{
    [level setActiveMissle:tag];
}

@end
