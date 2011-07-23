//
//  HelloWorldLayer.h
//  FreeRadicals
//
//  Created by Shawn Anderson on 7/22/11.
//  Copyright __MyCompanyName__ 2011. All rights reserved.
//


// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"

// HelloWorldLayer
@interface HelloWorldLayer : CCLayerColor
{
  CCSprite *_nucleus;
  CCSprite *_electron;
}
@property (nonatomic, retain) CCSprite *electron;
@property (nonatomic, retain) CCSprite *nucleus;

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;

@end
