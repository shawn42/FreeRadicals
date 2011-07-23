//
//  HelloWorldLayer.m
//  FreeRadicals
//
//  Created by Shawn Anderson on 7/22/11.
//  Copyright __MyCompanyName__ 2011. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"

// HelloWorldLayer implementation
@implementation HelloWorldLayer

@synthesize electron = _electron;
@synthesize nucleus = _nucleus;



+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HelloWorldLayer *layer = [HelloWorldLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
  if( (self=[super initWithColor:ccc4(25,25,25,255)] )) {
    CGSize winSize = [[CCDirector sharedDirector] winSize];
    self.nucleus = [CCSprite spriteWithFile:@"nucleus.png" 
                                           rect:CGRectMake(0, 0, 30, 26)];
    self.nucleus.position = ccp(winSize.width/2, winSize.height/2);
    
    
    self.electron = [CCSprite spriteWithFile:@"electron.png" 
                                            rect:CGRectMake(0, 0, 10, 10)];
    self.electron.position = ccp(self.nucleus.position.x+20, self.nucleus.position.y+20); 
    
    
    [self addChild:self.nucleus];		
    [self addChild:self.electron];		
    
    [self scheduleUpdate];
  }
  return self;
}

-(void) update: (ccTime) dt
{
  float speed = 140;
  float shellSize = 10.0;
  float shell = 2.0;

  float moveRads = CC_DEGREES_TO_RADIANS(speed * dt);
    
  float rads = ccpToAngle(ccpSub(self.electron.position, self.nucleus.position));
  rads -= moveRads;
  
  self.electron.position = ccpAdd(self.nucleus.position, ccp((shellSize * shell * cosf(rads)), (shellSize * shell * sinf(rads)))); 
}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
  [_nucleus release];
  [_electron release];
	[super dealloc];
}
@end
