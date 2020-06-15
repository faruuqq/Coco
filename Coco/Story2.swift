//
//  Story2.swift
//  Coco
//
//  Created by Muhammad Faruuq Qayyum on 12/06/20.
//  Copyright © 2020 Apple Academy. All rights reserved.
//

import SpriteKit
import GameplayKit

class Story2: SKScene {
    
    let background: SKSpriteNode = {
        let background = SKSpriteNode(imageNamed: "View 2")
        return background
    }()
    
    let sun: SKSpriteNode = {
        let sun = SKSpriteNode(imageNamed: "Matahari (1)")
        sun.setScale(0.3)
        return sun
    }()
    
    let sunBorder: SKSpriteNode = {
        let sunBorder = SKSpriteNode(imageNamed: "Matahari (2)")
        sunBorder.setScale(0.3)
        return sunBorder
    }()
    
    let textContainer: SKLabelNode = {
        let text = SKLabelNode()
        let attributedText = NSMutableAttributedString(string: "Their ship crashed into the waves and finally sank. However, Coco survived.", attributes: [NSAttributedString.Key.font : UIFont(name: "Chalkduster", size: 28)!])
        attributedText.append(NSAttributedString(string: "\n\nBut unfortunately, he was stranded on a foreign island.", attributes: [NSAttributedString.Key.font : UIFont(name: "Chalkduster", size: 28)!]))
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
        self.backgroundColor = .systemTeal
        self.run(SKAction.playSoundFileNamed("GameSceneAudio.mp3", waitForCompletion: false))
        
        layout()
    }
    
    private func layout() {
        
        //MARK: - Background
        background.size = CGSize(width: self.size.width, height: self.size.height)
        background.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        self.addChild(background)
        
        //MARK: - SUN
        sun.position = CGPoint(x: self.frame.maxX - 90, y: self.frame.maxY - 110)
        self.addChild(sun)
        
        sunBorder.position = CGPoint(x: self.frame.maxX - 90, y: self.frame.maxY - 110)
        self.addChild(sunBorder)
        
        let action = SKAction.rotate(byAngle: 180, duration: 200)
        sunBorder.run(SKAction.repeatForever(action.reversed()))
        
        //MARK: - Text Container
        textContainer.preferredMaxLayoutWidth = self.size.width - 40
        textContainer.position = CGPoint(x: self.frame.midX, y: self.frame.midY - 340)
        self.addChild(textContainer)
    }
    
    //MARK: - Touch Began
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard touches.first != nil else { return }
        
        let story3 = Story3()
        let transition = SKTransition.moveIn(with: .left, duration: 0.7)
        view?.presentScene(story3, transition: transition)
    }
    
}
