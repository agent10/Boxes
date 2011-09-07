//
//  GoodBlock.m
//  BoxesProject
//
//  Created by Kirill Olenyov on 9/7/11.
//  Copyright 2011 House. All rights reserved.
//

#import "GoodBlock.h"

@implementation GoodBlock

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (id)initWithPosition:(CGPoint) p andWithAngle:(float) a
{
    self = [super initWithPosition:p andWithAngle:a];
    if (self) {
        // Initialization code here.
        imagepath = @"green3.png";
    }
    
    return self;
}

@end
