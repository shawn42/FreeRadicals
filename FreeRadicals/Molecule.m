#import "Molecule.h"

@implementation Molecule

@synthesize nucleus = _nucleus;
@synthesize electrons = _electrons;



-(void) update: (ccTime) dt
{
  // TODO
}

-(void) addElectron {
  Electron *electron = [[Electron alloc] init];
  [self.electrons addObject:electron];
  
  [electron release];
}

- (void)dealloc {
  [_nucleus release];
  [_electrons release];
	[super dealloc];
}


@end
