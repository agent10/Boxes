//
//  BaseForegroundLayer.m
//  BoxesProject
//
//  Created by Kirill Olenyov on 9/8/11.
//  Copyright 2011 House. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseForegroundLayer.h"

@implementation BaseForegroundLayer

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
        
        //Scores area
        CCLabelTTF *scoretext = [CCLabelTTF labelWithString:@"Score:" fontName:@"Marker Felt" fontSize:20];
        scoretext.position =  ccp(400, 300);
        [self addChild: scoretext];
        
        scoreLabel = [CCLabelTTF labelWithString:@"0" fontName:@"Marker Felt" fontSize:20];
        scorePosition = 430;
        scoreLabel.position =  ccp(scorePosition, 300);
        [self addChild: scoreLabel];
        
        //Missles area
        mis1 = [CCSprite spriteWithFile: @"mis1.png"];
        mis1.position = ccp(30, 30);
        mis1.tag = 1;
        [self addChild:mis1];
        
        mis2 = [CCSprite spriteWithFile: @"mis2.png"];
        mis2.position = ccp(100, 30);
        mis1.tag = 2;
        [self addChild:mis2];
        
        mis3 = [CCSprite spriteWithFile: @"mis3.png"];
        mis3.position = ccp(170, 30);
        mis1.tag = 3;
        [self addChild:mis3];
        
        selectedMissle = [CCSprite spriteWithFile: @"circle.png"];
        selectedMissle.scale = 0.6f;
        selectedMissle.position = mis1.position;
        [self addChild:selectedMissle];
        
        self.isTouchEnabled = YES;
        [[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self priority:0 swallowsTouches:NO];
    }
    
    return self;
}

- (void) setScore:(int) score
{
    NSString* convert = [NSString stringWithFormat:@"%d", score];
    CGSize box = [convert sizeWithFont: [UIFont fontWithName:@"Marker Felt" size:20]];
    scoreLabel.position =  ccp(scorePosition + box.width/2, scoreLabel.position.y);
    [scoreLabel setString: convert];
}

- (void) setCallback:(id<ForegroundCallback>) callback
{
    delegate = callback;
}

- (void) fail
{
    //fail
}

- (void) win:(BOOL)isExcelent
{
    //win
}

- (BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event {
	return YES; 
}

//TODO: rewrite function
- (void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event {
	CGPoint location = [self convertTouchToNodeSpace: touch];
    int tag = 0;
    if (CGRectContainsPoint(mis1.boundingBox, location)) {
        tag = 1;
        selectedMissle.position = mis1.position;
    } else if (CGRectContainsPoint(mis2.boundingBox, location)) {
        tag = 2;
        selectedMissle.position = mis2.position;
    } else if (CGRectContainsPoint(mis3.boundingBox, location)) {
        tag = 3;
        selectedMissle.position = mis3.position;
    }
    if(tag != 0) {
        [delegate newMissleSelected:tag];
    }
}

@end
