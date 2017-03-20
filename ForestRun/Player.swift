//
//  Player.swift
//  ForestRun
//
//  Created by Caroline Davis on 20/03/2017.
//  Copyright © 2017 Caroline Davis. All rights reserved.
//

import SpriteKit

struct Collider {
    static let Player: UInt32 = 1
    static let Ground: UInt32 = 2
    static let Obstacle: UInt32 = 3
}

class Player: SKSpriteNode {
    
    func initialize() {
    
    var runAnimation = [SKTexture]()
    
        // dont put the first sprite cos thats the standing still one
        // this appends the sprite player files to the array and loops them
    for i in 2...8 {
        let name = ("Player \(i)")
        
        self.name = "Player"
        self.zPosition = 4
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5);
        self.setScale(0.5)
        
        // add physics body stuff
   
        runAnimation.append(SKTexture(imageNamed: name))
    }
        
        // this sets up the walking animation
    let animation = SKAction.animate(with: runAnimation, timePerFrame: TimeInterval(0.064), resize:true, restore: true);
        
        // this loops it forever and allows it to run
     self.run(SKAction.repeatForever(animation))
        
    }
    
}
