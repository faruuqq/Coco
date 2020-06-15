//
//  Story1.swift
//  Coco
//
//  Created by Muhammad Faruuq Qayyum on 12/06/20.
//  Copyright © 2020 Apple Academy. All rights reserved.
//

import SpriteKit
import GameplayKit

class Story1: SKScene {
    
    let seaImage: SKSpriteNode = {
        let seaImage = SKSpriteNode(imageNamed: "View 1")
        return seaImage
    }()
    
    let cloud1: SKSpriteNode = {
        let cloud = SKSpriteNode(imageNamed: "Awan (1)")
        cloud.setScale(0.5)
        return cloud
    }()
    
    let cloud2: SKSpriteNode = {
        let cloud = SKSpriteNode(imageNamed: "Awan (2)")
        cloud.setScale(0.7)
        return cloud
    }()
    
    let cloud3: SKSpriteNode = {
        let cloud = SKSpriteNode(imageNamed: "Awan (1)")
        cloud.setScale(0.7)
        return cloud
    }()
    
    let cloud4: SKSpriteNode = {
        let cloud = SKSpriteNode(imageNamed: "Awan (2)")
        cloud.setScale(0.7)
        return cloud
    }()
    
    let backroundSound: SKAudioNode = {
        let audio = SKAudioNode(fileNamed: "HeavyRain.mp3")
        audio.autoplayLooped = true
        return audio
    }()

    let textContainer: SKLabelNode = {
        let text = SKLabelNode()
        let attributedText = NSMutableAttributedString(string: "Coco and his parents are traveling to his private island.", attributes: [NSAttributedString.Key.font : UIFont(name: "Chalkduster", size: 28) ?? UIFont.systemFont(ofSize: 28, weight: .semibold)])
        attributedText.append(NSAttributedString(string: "\n\nBut in the middle of the trip to the island, there was a very big storm.", attributes: [NSAttributedString.Key.font : UIFont(name: "Chalkduster", size: 28) ?? UIFont.systemFont(ofSize: 28, weight: .semibold)]))
        text.attributedText = attributedText
        text.numberOfLines = 0
        text.horizontalAlignmentMode = .center
        text.lineBreakMode = .byWordWrapping
        text.zPosition = 2
        return text
    }()
    
    //MARK: - DidMove
    override func didMove(to view: SKView) {
        
        self.size.width = 414
        self.size.height = 896
        self.backgroundColor = .white
        addChild(backroundSound)
        backroundSound.run(SKAction.play())
        self.run(SKAction.group([
            SKAction.repeatForever(
            SKAction.sequence([
                SKAction.playSoundFileNamed("RollingThunder.mp3", waitForCompletion: true),
                SKAction.wait(forDuration: 0.2),
                SKAction.playSoundFileNamed("ThunderCrack.mp3", waitForCompletion: true)
            ]))
        ]))
        
        cloud1.run(SKAction.hide())
        cloud2.run(SKAction.hide())
        cloud3.run(SKAction.hide())
        cloud4.run(SKAction.hide())
        textContainer.run(SKAction.hide())
        
        layout()
        animation()
        
    }
    
    private func layout() {
        
        //MARK: - Layout SeaImage
        seaImage.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        seaImage.size = CGSize(width: self.frame.width, height: self.frame.height)
        addChild(seaImage)
        
        //MARK: - Layout Cloud
        cloud1.position = CGPoint(x: self.frame.minX + 130, y: self.frame.maxY - 100)
        cloud2.position = CGPoint(x: self.frame.maxX - 100, y: self.frame.maxY - 150)
        cloud3.position = CGPoint(x: self.frame.maxX - 80, y: self.frame.maxY - 80)
        cloud4.position = CGPoint(x: self.frame.minX + 80, y: self.frame.maxY - 180)
        addChild(cloud1)
        addChild(cloud2)
        addChild(cloud3)
        addChild(cloud4)
        
        //MARK: - Layout Text
        textContainer.position = CGPoint(x: self.frame.midX, y: self.frame.midY - 350 )
        textContainer.preferredMaxLayoutWidth = self.size.width - 40
        addChild(textContainer)
        
    }
    
    private func animation() {
        let fadeIn = SKAction.sequence([SKAction.fadeAlpha(to: 0, duration: 0.1), SKAction.unhide(), SKAction.wait(forDuration: 0.5), SKAction.fadeAlpha(to: 1, duration: 1)])
        let fadeInLong = SKAction.sequence([SKAction.fadeAlpha(to: 0, duration: 0.1), SKAction.unhide(), SKAction.wait(forDuration: 1), SKAction.fadeAlpha(to: 1, duration: 1)])
        let actionMove = SKAction.moveBy(x: -40, y: 0, duration: 3)
        let actionMoveLong = SKAction.moveBy(x: -100, y: 0, duration: 4)
        let actionMoveReverse = actionMove.reversed()
        let actionMoveLongReverse = actionMoveLong.reversed()
        
        cloud1.run(SKAction.group([
            fadeIn,
            SKAction.repeatForever(SKAction.sequence([
                actionMove,
                actionMoveReverse
            ]))
        ]))
        
        cloud2.run(SKAction.group([
            fadeInLong,
            SKAction.repeatForever(SKAction.sequence([
                actionMoveLong,
                actionMoveLongReverse
            ]))
        ]))
        
        cloud4.run(SKAction.group([
            fadeInLong,
            SKAction.repeatForever(SKAction.sequence([
                actionMoveLongReverse,
                actionMoveLong
            ]))
        ]))
        
        textContainer.run(fadeInLong)
    }
    
    //MARK: - Touch Began
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard touches.first != nil else { return }
        
        let story2 = Story2()
        let transition = SKTransition.push(with: .up, duration: 1)
        view?.presentScene(story2, transition: transition)
        
    }
    
}
