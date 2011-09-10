//
//  ScoreSprite.h
//  BoxesProject
//
//  Created by Kirill Olenyov on 9/10/11.
//  Copyright 2011 House. All rights reserved.
//

#import "cocos2d.h"

@interface ScoreSprite : CCSprite
{
}

+ (ScoreSprite*) scoreSpriteWithScoreValue:(int)score position:(CGPoint)position;
- (void) onUpFinished;
@end
