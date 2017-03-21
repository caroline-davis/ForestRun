//
//  GamePlayScene.swift
//  ForestRun
//
//  Created by Caroline Davis on 20/03/2017.
//  Copyright © 2017 Caroline Davis. All rights reserved.
//

import SpriteKit


class GamePlayScene: SKScene, SKPhysicsContactDelegate {
    
    var player = Player()
    
  //  var canJump = true
    
    override func didMove(to view: SKView) {
        initialize()
    }
    
    override func update(_ currentTime: TimeInterval) {
        // this will constanlty check to make sure background and grounds are visible
         movingBackgroundsAndGrounds()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            
        let location = touch.location(in: self)
        
        player.jump()
        }
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
            var firstBody = SKPhysicsBody();
            var secondBody = SKPhysicsBody();
            
            if contact.bodyA.node?.name == "Player" {
                firstBody = contact.bodyA;
                secondBody = contact.bodyB;
            } else {
                firstBody = contact.bodyB;
                secondBody = contact.bodyA;
            }
        
        if firstBody.node?.name == "Player" && secondBody.node?.name == "Ground" {
          //  player.jump()
        }
        
        if firstBody.node?.name == "Player" && secondBody.node?.name == "Obstacle" {
 
            }
            
        }

    
    func initialize() {
        
        physicsWorld.contactDelegate = self
        createBackground()
        createGround()
        createPlayer()
    }
    
    // adds the player child to the scene
    func createPlayer() {
        player = Player(imageNamed: "Player 1");
        player.initialize();
        player.position = CGPoint(x: -30, y: -(self.frame.size.height / 2) + 160);
        self.addChild(player);
    }

    
    func createBackground() {
        // have to remember this for the infinite background scroller!!!
        for i in 0...2 {
        let background = SKSpriteNode(imageNamed: "GamePlayBackground")
        background.name = "GamePlayBackground"
        background.anchorPoint = CGPoint(x: 0.5, y: 0.5)
            // important to add the x value correctly here!!
        background.position = CGPoint(x: CGFloat(i) * background.size.width, y: 0)
        background.zPosition = 1
        
        self.addChild(background)
        }
        
    }
    
    func createGround() {
        
        for i in 0...2 {
        let ground = SKSpriteNode(imageNamed: "GamePlayGround")
        ground.name = "GamePlayGround"
        ground.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        ground.position = CGPoint(x: CGFloat(i) * ground.size.width, y: -(self.frame.size.height / 2))
        ground.setScale(1.5)
        ground.zPosition = 2
            
        //physicsbody stuff
            ground.physicsBody = SKPhysicsBody(rectangleOf: ground.size)
            ground.physicsBody?.affectedByGravity = false
            ground.physicsBody?.isDynamic = false
            ground.physicsBody?.categoryBitMask = Collider.Ground
        
        self.addChild(ground)
        }
    }
    
    func movingBackgroundsAndGrounds() {
        
  
        // to add the infinity moving backgrounds
        enumerateChildNodes(withName: "GamePlayBackground", using:  ({ (node, error) in
        
        let backgroundNode = node as! SKSpriteNode
        
        backgroundNode.position.x -= 4
        
        if backgroundNode.position.x < -(self.frame.width) {
            backgroundNode.position.x += backgroundNode.size.width * 3
        }
        
        }))
        
        enumerateChildNodes(withName: "GamePlayGround", using: ({ (node, error) in
            
            let groundNode = node as! SKSpriteNode
            
            // sets the speed of the scroller
            groundNode.position.x -= 2
            
            // if the ground position is less than the frames width, then add it X 3 so we never get grey
            if groundNode.position.x < -(self.frame.width) {
                groundNode.position.x += groundNode.size.width * 3
            }
            
        }))
        
    
        
    }


    
}









