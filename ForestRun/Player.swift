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
        self.setScale(0.4)
        
        // add physics body stuff
        self.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: self.size.width - 20, height: self.size.height - 10))
        self.physicsBody?.affectedByGravity = true
        self.physicsBody?.allowsRotation = false
        self.physicsBody?.categoryBitMask = Collider.Player
        self.physicsBody?.collisionBitMask = Collider.Obstacle | Collider.Ground
        self.physicsBody?.contactTestBitMask = Collider.Obstacle | Collider.Ground
   
        runAnimation.append(SKTexture(imageNamed: name))
    }
        
        // this sets up the walking animation
    let animation = SKAction.animate(with: runAnimation, timePerFrame: TimeInterval(0.09), resize: true, restore: true)
        
        // this loops it forever and allows it to run
     self.run(SKAction.repeatForever(animation))
        
    }
    
    func jump() {
        self.physicsBody?.velocity = CGVector(dx: 0, dy: 0);
        self.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 1240));
    }
    
}
