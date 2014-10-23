#import "GamePlayScene.h"
#import "Character.h"
#import "Obstacle.h"

@implementation GamePlayScene

- (void)initialize
{
    // Create charcter and add it to the physics node
    character = (Character*)[CCBReader load:@"Character"];
    [physicsNode addChild:character];
    
    // Adding Obstacle
    [self addObstacle];
}

-(void)update:(CCTime)delta
{
    // put update code here
}

// Touch interaction
- (void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event {
    // this will get called every time the player touches the screen
    [character flap];
}

@end
