//
//  BaseLevelLayer.m
//  BoxesProject
//
//  Created by Kirill Olenyov on 9/3/11.
//  Copyright 2011 House. All rights reserved.
//

#import "BaseLevelLayer.h"

//Pixel to metres ratio.
#define PTM_RATIO 32

@implementation BaseLevelLayer

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
        self.isTouchEnabled = YES;
        
        
        // Box2D init.
        // Define the gravity vector.
		b2Vec2 gravity;
		gravity.Set(0.0f, -10.0f);
        
        // Do we want to let bodies sleep?
		// This will speed up the physics simulation
		bool doSleep = true;
		
		// Construct a world object, which will hold and simulate the rigid bodies.
		world = new b2World(gravity, doSleep);
		
		world->SetContinuousPhysics(true);
		
		// Debug Draw functions
		m_debugDraw = new GLESDebugDraw( PTM_RATIO );
		world->SetDebugDraw(m_debugDraw);
		
		uint32 flags = 0;
		flags += b2DebugDraw::e_shapeBit;
        //		flags += b2DebugDraw::e_jointBit;
        //		flags += b2DebugDraw::e_aabbBit;
        //		flags += b2DebugDraw::e_pairBit;
        //		flags += b2DebugDraw::e_centerOfMassBit;
		m_debugDraw->SetFlags(flags);
    }
    
    return self;
}

- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	delete world;
	world = NULL;
	
	delete m_debugDraw;
    
	// don't forget to call "super dealloc"
	[super dealloc];
}

-(void) draw
{
	// Default GL states: GL_TEXTURE_2D, GL_VERTEX_ARRAY, GL_COLOR_ARRAY, GL_TEXTURE_COORD_ARRAY
	// Needed states:  GL_VERTEX_ARRAY, 
	// Unneeded states: GL_TEXTURE_2D, GL_COLOR_ARRAY, GL_TEXTURE_COORD_ARRAY
	glDisable(GL_TEXTURE_2D);
	glDisableClientState(GL_COLOR_ARRAY);
	glDisableClientState(GL_TEXTURE_COORD_ARRAY);
	
	world->DrawDebugData();
	
	// restore default GL states
	glEnable(GL_TEXTURE_2D);
	glEnableClientState(GL_COLOR_ARRAY);
	glEnableClientState(GL_TEXTURE_COORD_ARRAY);
    
}

-(void) tick: (ccTime) dt
{
	//It is recommended that a fixed time step is used with Box2D for stability
	//of the simulation, however, we are using a variable time step here.
	//You need to make an informed choice, the following URL is useful
	//http://gafferongames.com/game-physics/fix-your-timestep/
	
	int32 velocityIterations = 8;
	int32 positionIterations = 1;
	
	world->Step(dt, velocityIterations, positionIterations);
    
	
	//Iterate over the bodies in the physics world
	for (b2Body* b = world->GetBodyList(); b; b = b->GetNext())
	{
		if (b->GetUserData() != NULL) {
			//Synchronize the AtlasSprites position and rotation with the corresponding body
			/*CCSprite *myActor = (CCSprite*)b->GetUserData();
            if(b->GetPosition().y * PTM_RATIO <= -2) { // -2 - delete object, move to the constant
                [self removeChild:myActor cleanup:YES];
                world->DestroyBody(b);
                continue;
            }
			myActor.position = CGPointMake( b->GetPosition().x * PTM_RATIO, b->GetPosition().y * PTM_RATIO);
			myActor.rotation = -1 * CC_RADIANS_TO_DEGREES(b->GetAngle());*/
            BaseGameObject* gameobject = (BaseGameObject*)b->GetUserData();
            [gameobject updatePosition];
		}	
	}
}

- (void)setGunArea:(CGPoint) location radius: (float)radius
{
    CannonZone* cannon = [CannonZone spriteWithFile: @"circle.png"]; //TODO: shoulb be replaced by image
    cannon.position = location;
    [cannon setCallback:(id<CannonZoneCallback>) self];
    [self addChild:cannon];
    
    [self schedule: @selector(tick:)];
}

-(void) fire: (CGPoint)location vec: (CGPoint)vec force: (float)force
{    
    BaseGameObject* missle = [self addGameObject:[[Missle alloc] initWithPosition:ccp(location.x, location.y) andWithAngle:0]];
    
    b2Body* body = [missle getBody];
    body->ApplyForce(b2Vec2(force*vec.x,force*vec.y), b2Vec2(location.x/PTM_RATIO, location.y/PTM_RATIO));
}

-(BaseGameObject*) addGameObject:(BaseGameObject*) gameObject
{
    if(gameObject != nil) {
        [gameObject makeObjectWithLayer:self andWorld:world];
    }
    return gameObject;
}
         
- (void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    for( UITouch *touch in touches ) {
		CGPoint location = [touch locationInView: [touch view]];
		location = [[CCDirector sharedDirector] convertToGL: location];
	}
}

- (void)ccTouchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    for( UITouch *touch in touches ) {
        CGPoint location = [self convertTouchToNodeSpace: touch];
    }
}

- (void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	for( UITouch *touch in touches ) {
		CGPoint location = [touch locationInView: [touch view]];
		
		location = [[CCDirector sharedDirector] convertToGL: location];
	}
}




@end
