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
- (void) fail;
- (void) win:(BOOL)isExcellent;
- (void) replayLevel;
- (void) startNextLevel;
- (void) quitToMenu;
@end
