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
- (void)gameObjectFell:(int)gameObjectID;
- (void)gameObjectsContactID1:(int)id1 andID2:(int)id2;
@end
