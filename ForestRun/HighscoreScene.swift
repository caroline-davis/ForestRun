//
//  HighscoreScene.swift
//  ForestRun
//
//  Created by Caroline Davis on 20/03/2017.
//  Copyright © 2017 Caroline Davis. All rights reserved.
//

import SpriteKit

class HighscoreScene: SKScene {
    
    var back = SKSpriteNode(imageNamed: "Back")
    
    override func didMove(to view: SKView) {
        initialize()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    
        for touch in touches {
            
            let location = touch.location(in: self)
            
            // opens highscoreScene
            if atPoint(location) == back {
                if let scene = MainMenuScene(fileNamed: "MainMenuScene") {
                    // Set the scale mode to scale to fit the window
                    scene.scaleMode = .aspectFill
                    
                    // Present the scene
                    view?.presentScene(scene)
                }
                
            }
            
        }
    
    }
    
    func initialize() {
        createBack()
        createScore()
    }
    
    func createBack() {
        
        back.position = CGPoint(x: -550, y: -320)
        back.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        back.zPosition = 3
        
        self.addChild(back)
    }
    
    func createScore() {
        
        let highScore = SKLabelNode(fontNamed: "ChalkboardSE-Bold")
        
        highScore.fontSize = 120
        highScore.fontColor = .black
        highScore.text = "20"
        highScore.position = CGPoint(x: 0, y: -145)
        highScore.zPosition = 3
        
        self.addChild(highScore)
        
        
    }
    
    
}
