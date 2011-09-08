//
//  LevelCallback.h
//  BoxesProject
//
//  Created by Kirill Olenyov on 9/8/11.
//  Copyright 2011 House. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol LevelCallback <NSObject>
@optional
- (void)newScore: (int)score;
@end
