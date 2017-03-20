//
//  GamePlayScene.swift
//  ForestRun
//
//  Created by Caroline Davis on 20/03/2017.
//  Copyright © 2017 Caroline Davis. All rights reserved.
//

import SpriteKit

class GamePlayScene: SKScene {
    
    override func didMove(to view: SKView) {
        initialize()
    }
    
    override func update(_ currentTime: TimeInterval) {
         movingBackgroundsAndGrounds()
    }
    
    func initialize() {
        createBackground()
        createGround()
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









