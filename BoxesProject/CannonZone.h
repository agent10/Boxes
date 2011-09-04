//
//  CannonZone.h
//  BoxesProject
//
//  Created by Kirill Olenyov on 9/4/11.
//  Copyright 2011 House. All rights reserved.
//

#import "cocos2d.h"
#import "Box2D.h"
#import "CannonZoneCallback.h"

@interface CannonZone : CCSprite
{
    CCSprite* cannon;
    CGPoint fpoint;
    
    @private
    BOOL captioned;
    id<CannonZoneCallback> delegate;
}

- (void) setCallback:(id<CannonZoneCallback>) callback;

@end
