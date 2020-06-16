//
//  GameScene.swift
//  Coco
//
//  Created by Muhammad Faruuq Qayyum on 11/06/20.
//  Copyright © 2020 Apple Academy. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
//    var viewController: UIViewController?
//    let sceneViewController: UIViewController = self.view?.window?.rootViewController
    
    let playBtn: SKSpriteNode = {
        let playBtn = SKSpriteNode(imageNamed: "Play_button")
        playBtn.setScale(0.15)
        return playBtn
    }()
    
    let background: SKSpriteNode = {
        let background = SKSpriteNode(imageNamed: "Opening_background")
        background.zPosition = -1
        return background
    }()
    
    let audio: SKAudioNode = {
        let audio = SKAudioNode(fileNamed: "GameSceneAudio.mp3")
        audio.autoplayLooped = true
        return audio
    }()
    
    let buttonSound: SKAudioNode = {
        let audio = SKAudioNode(fileNamed: "ButtonClicked.mp3")
        audio.autoplayLooped = false
        return audio
    }()
    
    //MARK: - DidMove
    override func didMove(to view: SKView) {
        layout()
        sounds()
    }
    
    func layout() {
        
        //MARK: - Background Layout
        background.size = CGSize(width: self.frame.width, height: self.frame.height)
        self.addChild(background)
        
        //MARK: - Button Play Layout
        playBtn.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        self.addChild(playBtn)
        
        let scaleBig = SKAction.scale(to: 0.18, duration: 0.5)
        let scaleBigReverse = SKAction.scale(to: 0.15, duration: 0.5)
        let sequenceAction = SKAction.sequence([scaleBig, scaleBigReverse])
        playBtn.run(SKAction.repeatForever(sequenceAction))
    }
    
    //MARK: - Audio
    func sounds() {
        addChild(audio)
        let adjustVolume = SKAction.changeVolume(to: 0.3, duration: 0)
        audio.run(SKAction.group([adjustVolume, SKAction.play()]))
        
        addChild(buttonSound)
    }
    
    //MARK: - Touch Interaction
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard touches.first != nil else { return }
        
        if playBtn.frame.contains((touches.first?.location(in: self))!) {
            buttonSound.run(SKAction.play())
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if playBtn.frame.contains((touches.first?.location(in: self))!) {
            self.run(SKAction.sequence([SKAction.wait(forDuration: 1.2), SKAction.run {
                let story1 = Story1()
                let transition = SKTransition.push(with: .up, duration: 1)
//                let storyVC = StoryVC()
                self.view?.presentScene(story1, transition: transition)
//                self.viewController?.present(storyVC, animated: true, completion: nil)
//                self.viewController.present(storyVC, animated: true, completion: nil)
                }]))
        }
    }
}
