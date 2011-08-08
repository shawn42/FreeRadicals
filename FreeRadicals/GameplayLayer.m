//
//  HelloWorldLayer.m
//  FreeRadicals
//
//  Created by Shawn Anderson on 7/22/11.
//  Copyright __MyCompanyName__ 2011. All rights reserved.
//


// Import the interfaces
#import "GameplayLayer.h"

// HelloWorldLayer implementation
@implementation GameplayLayer

@synthesize electron = _electron;
@synthesize nucleus = _nucleus;
@synthesize chargingSoundSource = _chargingSoundSource;
@synthesize charging;
@synthesize currentCharge;


+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	GameplayLayer *layer = [GameplayLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
  if( (self=[super initWithColor:ccc4(25,25,25,255)] )) {
    [[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"background.wav"];
    self.chargingSoundSource = [[SimpleAudioEngine sharedEngine] soundSourceForFile:@"atom_charge.wav"];
    self.chargingSoundSource.looping = YES;
    
    CGSize winSize = [[CCDirector sharedDirector] winSize];
    self.nucleus = [CCSprite spriteWithFile:@"nucleus.png" 
                                           rect:CGRectMake(0, 0, 30, 26)];
    self.nucleus.position = ccp(winSize.width/2, winSize.height/2);
    
    
    self.electron = [CCSprite spriteWithFile:@"electron.png" 
                                            rect:CGRectMake(0, 0, 10, 10)];
    self.electron.position = ccp(self.nucleus.position.x+20, self.nucleus.position.y+20); 
    
    
    [self addChild:self.nucleus];		
    [self addChild:self.electron];		
    
    self.isTouchEnabled = YES;
    
    [self scheduleUpdate];
  }
  return self;
}

- (void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
  UITouch *touch = [touches anyObject];
  CGPoint location = [touch locationInView:[touch view]];
  location = [[CCDirector sharedDirector] convertToGL:location];
  self.currentCharge = 0.0;
  
  CGRect nucleusRect = CGRectMake(
     self.nucleus.position.x - (self.nucleus.contentSize.width/2), 
     self.nucleus.position.y - (self.nucleus.contentSize.height/2), 
     self.nucleus.contentSize.width, 
     self.nucleus.contentSize.height);
  
  if (CGRectContainsPoint(nucleusRect, location)) {
    self.charging = YES;
    [self.chargingSoundSource play];
  }
  
  
}

- (void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
  if (self.charging) {
    self.charging = NO;  
    NSLog(@"discharge %f", currentCharge);
    [self.chargingSoundSource stop];
    [[SimpleAudioEngine sharedEngine] playEffect:@"electron_freed.wav"];
    
    // XXX: reminder of how to remove children.
    [self removeChild:self.electron cleanup:YES];	
  }
}

-(void) update: (ccTime) dt
{
  float speed = 140;
  float shellSize = 10.0;
  float shell = 2.0;
  float chargePerSecond = 50;

  float rads = ccpToAngle(ccpSub(self.electron.position, self.nucleus.position)) - CC_DEGREES_TO_RADIANS(speed * dt);  
  self.electron.position = ccpAdd(self.nucleus.position, ccp((shellSize * shell * cosf(rads)), (shellSize * shell * sinf(rads)))); 
  
  currentCharge += dt * chargePerSecond;
}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
  [_chargingSoundSource release];
  [_nucleus release];
  [_electron release];
	[super dealloc];
}
@end
