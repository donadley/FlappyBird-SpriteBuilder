#import "GamePlayScene.h"
#import "Character.h"
#import "Obstacle.h"

@implementation GamePlayScene

- (void)initialize
{
    // Create charcter and add it to the physics node
    character = (Character*)[CCBReader load:@"Character"];
    [physicsNode addChild:character];
    
    // Time to spawn obstacle
    timeSinceObstacle = 0.0f;
    
}

// Runs 60 times per second (default).
// this will be run every frame.
// delta is the time that has elapsed since the last time it was run. This is usually 1/60, but can be bigger if the game slows down
-(void)update:(CCTime)delta
{
    // Increment the time since the last obstacle was added
    timeSinceObstacle += delta; // delta is approximately 1/60th of a second
    
    // Check to see if two seconds have passed
    if (timeSinceObstacle > 2.0f)
    {
        // Add a new obstacle
        [self addObstacle];
        
        // Then reset the timer.
        timeSinceObstacle = 0.0f;
    }
}

// Touch interaction
- (void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event {
    // this will get called every time the player touches the screen
    [character flap];
}

@end
