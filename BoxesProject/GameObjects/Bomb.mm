//
//  Bomb.m
//  BoxesProject
//
//  Created by Kirill Olenyov on 9/10/11.
//  Copyright 2011 House. All rights reserved.
//

#import "Bomb.h"

@implementation Bomb

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
        imagepath = @"bomb.png";
    }
    
    return self;
}

- (void) launchBomb:(b2World*) world
{
    //In Box2D the bodies are a linked list, so keep getting the next one until it doesn't exist.
	for (b2Body* b = world->GetBodyList(); b; b = b->GetNext())
	{
        //Box2D uses meters, there's 32 pixels in one meter. PTM_RATIO is defined somewhere in the class.
		b2Vec2 b2TouchPosition = b2Vec2(position.x/PTM_RATIO, position.y/PTM_RATIO);
		b2Vec2 b2BodyPosition = b2Vec2(b->GetPosition().x, b->GetPosition().y);
        
        //Don't forget any measurements always need to take PTM_RATIO into account
		float maxDistance = 29; // In your head don't forget this number is low because we're multiplying it by 32 pixels;
		int maxForce = 22;
		CGFloat distance; // Why do i want to use CGFloat vs float - I'm not sure, but this mixing seems to work fine for this little test.
		CGFloat strength;
		float force;
		CGFloat angleBetweenBodies;
        
		distance = b2Distance(b2BodyPosition, b2TouchPosition);
        if(distance > maxDistance) distance = maxDistance - 0.01;
        
        // Normally if distance is max distance, it'll have the most strength, this makes it so the opposite is true - closer = stronger
        strength = (maxDistance - distance) / maxDistance; // This makes it so that the closer something is - the stronger, instead of further
        force = strength * maxForce;
        angleBetweenBodies = atan2f(b2BodyPosition.y - b2TouchPosition.y, b2BodyPosition.x - b2TouchPosition.x);
        //NSLog(@" distance:%0.2f,force:%0.2f,angle:%0.2f", distance, force, angle);
        // Apply an impulse to the body, using the angle
        b->ApplyLinearImpulse(b2Vec2(cosf(angleBetweenBodies) * force, sinf(angleBetweenBodies) * force), b->GetPosition());
	}
}

- (void) actionByContactWithObject:(int)objectID layer:(CCLayer*) layer andWorld:(b2World*) world;
{
    if(objectID != MISSLE_ID) { //Bomb react only to Missle TODO: id should be changed
        return;
    }
    [[self getSprite] setVisible:NO];
    shouldBeDeleted = YES;
    [self launchBomb:world];
}

@end
