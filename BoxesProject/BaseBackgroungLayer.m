//
//  BaseBackgroungLayer.m
//  BoxesProject
//
//  Created by Kirill Olenyov on 9/4/11.
//  Copyright 2011 House. All rights reserved.
//

#import "BaseBackgroungLayer.h"

@implementation BaseBackgroungLayer

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (void)setBackground: (NSString*)file
{
    CCSprite* background = [CCSprite spriteWithFile: file];
    if(background == nil) {
        return;
    }
    background.position = ccp(background.boundingBox.size.width / 2,background.boundingBox.size.height / 2);
    [self addChild:background];
}

@end
