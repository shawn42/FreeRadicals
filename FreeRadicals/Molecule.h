#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Electron.h"

@interface Molecule : NSObject {
  CCSprite *_nucleus;
  NSMutableArray *_electrons;
}

@property (nonatomic, retain) CCSprite *nucleus;
@property (nonatomic, retain) NSMutableArray *electrons;

-(void) update: (ccTime) dt;
-(void) addElectron;

@end
