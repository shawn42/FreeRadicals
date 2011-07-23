//
//  HelloWorldLayer.h
//  FreeRadicals
//
//  Created by Shawn Anderson on 7/22/11.
//  Copyright __MyCompanyName__ 2011. All rights reserved.
//


// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"
#import "SimpleAudioEngine.h"

// HelloWorldLayer
@interface HelloWorldLayer : CCLayerColor
{
  CCSprite *_nucleus;
  CCSprite *_electron;
  BOOL charging;
  float currentCharge;
  CDSoundSource *_chargingSoundSource;
}
@property (nonatomic, retain) CCSprite *electron;
@property (nonatomic, retain) CCSprite *nucleus;
@property (nonatomic, assign, getter=isCharging) BOOL charging;
@property (nonatomic, assign) float currentCharge;
@property (nonatomic, retain) CDSoundSource *chargingSoundSource;

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;

@end
