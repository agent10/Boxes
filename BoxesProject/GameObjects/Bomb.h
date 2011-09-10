//
//  Bomb.h
//  BoxesProject
//
//  Created by Kirill Olenyov on 9/10/11.
//  Copyright 2011 House. All rights reserved.
//

#import "DynamicObstacle.h"

@interface Bomb : DynamicObstacle
{
    
}

- (void) launchBomb:(b2World*) world;
@end
