//
//  BaseSceneCallback.h
//  BoxesProject
//
//  Created by Kirill Olenyov on 9/10/11.
//  Copyright 2011 House. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BaseSceneCallback <NSObject>
@optional
- (void) win:(BOOL)isExcellent;
@end
