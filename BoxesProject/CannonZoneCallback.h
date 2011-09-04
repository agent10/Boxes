//
//  CannonZoneCallback.h
//  BoxesProject
//
//  Created by Kirill Olenyov on 9/4/11.
//  Copyright 2011 House. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CannonZoneCallback <NSObject>
@optional
- (void)fire: (CGPoint)location vec: (CGPoint)vec force: (float)force;
@end
