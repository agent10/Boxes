//
//  ForegroundCallback.h
//  BoxesProject
//
//  Created by Kirill Olenyov on 9/8/11.
//  Copyright 2011 House. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ForegroundCallback <NSObject>
@optional
- (void)newMissleSelected: (int)tag;
- (void) replayMenuSelected;
- (void) nextLevelMenuSelected;
- (void) quitToMenuSelected;
@end
