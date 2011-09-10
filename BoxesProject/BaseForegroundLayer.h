//
//  BaseForegroundLayer.h
//  BoxesProject
//
//  Created by Kirill Olenyov on 9/8/11.
//  Copyright 2011 House. All rights reserved.
//

#import "cocos2d.h"
#import "ForegroundCallback.h"

@interface BaseForegroundLayer : CCLayer
{
    CCLabelTTF *scoreLabel;
    
    CCSprite* mis1;
    CCSprite* mis2;
    CCSprite* mis3;
    
    CCSprite* selectedMissle;
    
@private
    id<ForegroundCallback> delegate;
    int scorePosition;
}

- (void) setScore:(int) score;
- (void) setCallback:(id<ForegroundCallback>) callback;
- (void) fail;
- (void) win:(BOOL)isExcelent;
@end
