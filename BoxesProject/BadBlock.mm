//
//  BadBlock.m
//  BoxesProject
//
//  Created by Kirill Olenyov on 9/10/11.
//  Copyright 2011 House. All rights reserved.
//

#import "BadBlock.h"

@implementation BadBlock

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
        gameObjectID = BAD_BLOCK_ID;
        objectScore = 115;
    }
    
    return self;
}

- (id)initWithPosition:(CGPoint) p andWithAngle:(float) a
{
    self = [super initWithPosition:p andWithAngle:a];
    if (self) {
        // Initialization code here.
        imagepath = @"blue2.png";
    }
    
    return self;
}

@end
