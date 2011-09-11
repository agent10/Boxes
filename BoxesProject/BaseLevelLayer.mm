//
//  BaseLevelLayer.m
//  BoxesProject
//
//  Created by Kirill Olenyov on 9/3/11.
//  Copyright 2011 House. All rights reserved.
//

#import "BaseLevelLayer.h"
#import "ContactReceiver.h"

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
        
        contactReceiver = new ContactReceiver((id<ContactReceiverCallback>)self);
        world->SetContactListener(contactReceiver);
		
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
        
        [self schedule: @selector(tick:)];
    }
    
    return self;
}

- (void) dealloc
{
    [self unschedule:@selector(tick:)];
    
    for (b2Body* b = world->GetBodyList(); b; b = b->GetNext())
	{
		if (b->GetUserData() != NULL) {
            BaseGameObject* gameobject = (BaseGameObject*)b->GetUserData();
            if([gameobject shouldBeDeleted]) {
                [self removeGameObject:gameobject];
                continue;
            }
		}	
	}

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
    
	for (b2Body* b = world->GetBodyList(); b; b = b->GetNext())
	{
		if (b->GetUserData() != NULL) {
            BaseGameObject* gameobject = (BaseGameObject*)b->GetUserData();
            if([gameobject shouldBeDeleted]) {
                [self removeGameObject:gameobject];
                continue;
            }
            
            if(b->GetPosition().y * PTM_RATIO <= -5) { // -5 - delete object, move to the constant
                int gameObjectID = [gameobject getGameObjectID];
                CGPoint pos = [gameobject getSprite].position;
                int score = [gameobject objectScore];
                if(score != 0) {
                    [self addChild:[ScoreSprite scoreSpriteWithScoreValue:155 position:pos]];
                    [delegate newScore:155]; //TODO: Remove this callback
                }
                
                [self removeGameObject:gameobject];
                
                [delegate gameObjectFell:gameObjectID];
                continue;
            }
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
}

-(void) fire: (CGPoint)location vec: (CGPoint)vec force: (float)force
{    
    BaseMissle* baseMissle = [self createMissle:location];
    BaseGameObject* missle = [self addGameObject:baseMissle];    
    b2Body* body = [missle getBody];
    float endforce = force * [baseMissle getForceValue];
    body->ApplyForce(b2Vec2(endforce*vec.x,endforce*vec.y), b2Vec2(location.x/PTM_RATIO, location.y/PTM_RATIO));
}

-(BaseGameObject*) addGameObject:(BaseGameObject*) gameObject
{
    if(gameObject != nil) {
        [gameObject makeObjectWithLayer:self andWorld:world];
    }
    if ([gameObject getGameObjectID] == GOOD_BLOCK_ID) {
        goodCount++;
    } else if ([gameObject getGameObjectID] == BAD_BLOCK_ID) {
        badCount++;
    }
    return gameObject;
}

- (void) removeGameObject:(BaseGameObject*)gameObject
{
    if ([gameObject getGameObjectID] == GOOD_BLOCK_ID) {
        goodCount--;
    } else if ([gameObject getGameObjectID] == BAD_BLOCK_ID) {
        badCount--;
    }
    
    [self removeChild:[gameObject getSprite] cleanup:YES];
    world->DestroyBody([gameObject getBody]);
    [gameObject release];
}

- (void) setCallback:(id<LevelCallback>) callback
{
    delegate = callback;
}

- (void) setActiveMissle:(int)missle
{
    activeMissle = missle;
}

- (BaseMissle*) createMissle:(CGPoint)position
{
    //TODO: Rewrite
    switch (activeMissle) {
        case 1:
            return [[Missle alloc] initWithPosition:position andWithAngle:0];
            break;
        case 2:
            return [[MissleType2 alloc] initWithPosition:position andWithAngle:0];
            break;
        case 3:
            return [[MissleType3 alloc] initWithPosition:position andWithAngle:0];
            break;
        default:
            break;
    }
    return [[Missle alloc] initWithPosition:position andWithAngle:0];
}

- (void)onNewContact:(b2Contact*) contact
{
    // Box2d objects that collided
	b2Fixture* fixtureA = contact->GetFixtureA();
	b2Fixture* fixtureB = contact->GetFixtureB();
	// BaseGameObject that collided
	BaseGameObject* actorA = (BaseGameObject*) fixtureA->GetBody()->GetUserData();
	BaseGameObject* actorB = (BaseGameObject*)  fixtureB->GetBody()->GetUserData();
    
	// This is only true if for example a sprite touched something in your box2d simulation that was not a sprite such as the ground
	// You may not want to return here, so keep that in mind
	if(actorA == nil || actorB == nil) return;
    
    int id1 = [actorA getGameObjectID];
    int id2 = [actorB getGameObjectID];
    [actorA actionByContactWithObject:id2 layer:self andWorld:world];
    [actorB actionByContactWithObject:id1 layer:self andWorld:world];
    [delegate gameObjectsContactID1:id1 andID2:id2];
	// Information about the collision, such as where it hit exactly on each body 
	//b2WorldManifold* worldManifold = new b2WorldManifold();
	//contact->GetWorldManifold(worldManifold);
}

- (int) getGoodBlockCount 
{
    return goodCount;
}

- (int) getBadBlockCount
{
    return badCount;
}

- (void) fail
{
    [self stopAllBodies];
}

- (void) win:(BOOL)isExcelent
{
    [self stopAllBodies];
}

- (void) stopAllBodies
{
    for (b2Body* b = world->GetBodyList(); b; b = b->GetNext())
	{
        b->SetAwake(NO);
    }
}

@end
