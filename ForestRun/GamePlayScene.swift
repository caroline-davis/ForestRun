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
    
    func initialize() {
        createBackground()
        createGround()
    }
    
    func createBackground() {
        
        let background = SKSpriteNode(imageNamed: "GamePlayBackground")
        background.name = "GamePlayBackground"
        background.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        background.position = CGPoint(x: 0, y: 0)
        background.zPosition = 1
        
        self.addChild(background)
    }
    
    func createGround() {
        
        let ground = SKSpriteNode(imageNamed: "GamePlayGround")
        ground.name = "GamePlayGround"
        ground.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        ground.position = CGPoint(x: 0, y: -(self.frame.size.height / 2))
        ground.setScale(1.5)
        ground.zPosition = 2
        
        self.addChild(ground)
    }
    
    
}









