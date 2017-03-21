//
//  MainMenuScene.swift
//  ForestRun
//
//  Created by Caroline Davis on 20/03/2017.
//  Copyright © 2017 Caroline Davis. All rights reserved.
//

import SpriteKit

class MainMenuScene: SKScene {
    
    let playButton = SKSpriteNode(imageNamed: "PlayBtn")
    let scoreButton = SKSpriteNode(imageNamed: "ScoreBtn")
    
    
    var sound = SKSpriteNode(imageNamed: "MusicOff")
    private let soundOn = SKTexture(imageNamed: "MusicOn")
    private let soundOff = SKTexture(imageNamed: "MusicOff")
    var musicPlaying = true
  
    
    override func didMove(to view: SKView) {
       initialize()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            
            let location = touch.location(in: self)
            
            // open gameplayScene
            if atPoint(location) == playButton {
                if let scene = GamePlayScene(fileNamed: "GamePlayScene") {
                    // Set the scale mode to scale to fit the window
                    scene.scaleMode = .aspectFill
            
                    // Present the scene
                    view?.presentScene(scene)
                }
                
            }
            
            // opens highscoreScene
            if atPoint(location) == scoreButton {
                if let scene = HighscoreScene(fileNamed: "HighscoreScene") {
                    // Set the scale mode to scale to fit the window
                    scene.scaleMode = .aspectFill
                    
                    // Present the scene
                    view?.presentScene(scene)
                }

            }

            
            // if player touches the sound button
            if atPoint(location) == sound {
                if musicPlaying == true {
                    AudioManager.instance.stopBgMusic()
                    sound.texture = soundOn
                    musicPlaying = false
                } else {
                    AudioManager.instance.playBGMusic()
                    sound.texture = soundOff
                    musicPlaying = true
                }
            }
            
        } // for touch in touches end.
    } //touches began end.
    
    
    func initialize() {
        createBackground()
        createButtons()
        AudioManager.instance.playBGMusic()
    }
    
    func createBackground() {
        
        let background = SKSpriteNode(imageNamed: "MainMenuBackground")
    
        background.position = CGPoint(x: 0, y: 0)
        background.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        background.zPosition = 1
            
        self.addChild(background)
        
    }
    
    func createButtons() {
        
        playButton.position = CGPoint(x: -300, y: -180)
        playButton.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        playButton.zPosition = 2
        playButton.setScale(0.75)
        
        scoreButton.position = CGPoint(x: 300, y: -180)
        scoreButton.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        scoreButton.zPosition = 2
        scoreButton.setScale(0.75)
        
        sound.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        sound.position = CGPoint(x: 570, y: -300)
        sound.zPosition = 2
        sound.setScale(0.5)
        
        self.addChild(playButton)
        self.addChild(scoreButton)
        self.addChild(sound)
        
    }
    

    
}
