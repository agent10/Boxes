//
//  ScoreSprite.m
//  BoxesProject
//
//  Created by Kirill Olenyov on 9/10/11.
//  Copyright 2011 House. All rights reserved.
//

#import "ScoreSprite.h"

@implementation ScoreSprite

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (id)initWithScore:(int)score andPosition:(CGPoint)position
{
    self = [super init];
    if (self) {

        NSString* convert = [NSString stringWithFormat:@"%d", score];
        CCLabelTTF* scoreLabel = [CCLabelTTF labelWithString:convert fontName:@"Marker Felt" fontSize:20];
        scoreLabel.position = position;
        [self addChild: scoreLabel];
        
        id actionTo = [CCMoveTo actionWithDuration: 0.4 position:ccp(scoreLabel.position.x, scoreLabel.position.y + 45)];
        id fadeOut = [CCFadeOut actionWithDuration: 0.3];
        id call = [CCCallFunc actionWithTarget:self selector:@selector(onUpFinished)];
        id sequence = [CCSequence actions:actionTo, fadeOut, call, nil];
        
        [scoreLabel runAction:sequence];
        
    }
    
    return self;
}

- (void) dealloc
{
    [super dealloc];
}

+ (ScoreSprite*) scoreSpriteWithScoreValue:(int)score position:(CGPoint)position;
{
    return [[[ScoreSprite alloc] initWithScore:score andPosition:position] autorelease];
}
                   
- (void) onUpFinished
{
    [self removeAllChildrenWithCleanup:YES];
    [[self parent] removeChild:self cleanup:YES];
}
                   
@end
