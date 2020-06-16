//
//  Story6.swift
//  Coco
//
//  Created by Muhammad Faruuq Qayyum on 13/06/20.
//  Copyright © 2020 Apple Academy. All rights reserved.
//

import SpriteKit
import GameplayKit

class Story6: SKScene {
    
    let backgroundImg: SKSpriteNode = {
        let background = SKSpriteNode(imageNamed: "View 6")
        return background
    }()
    
    let bubble: SKSpriteNode = {
        let bubble = SKSpriteNode(imageNamed: "Bubble (2)")
        bubble.setScale(0.04)
        bubble.zPosition = 2
        return bubble
    }()
    
    let textContainer: SKLabelNode = {
        let text = SKLabelNode()
        let attributedText = NSMutableAttributedString(string: "After searching for people on the island and unsuccessful, he felt tired and hungry.", attributes: [NSAttributedString.Key.font : UIFont(name: "Chalkduster", size: 22)!])
        text.attributedText = attributedText
        text.lineBreakMode = .byWordWrapping
        text.horizontalAlignmentMode = .center
        text.numberOfLines = 0
        text.zPosition = 3
        return text
    }()
    
    //MARK: - DidMove
    override func didMove(to view: SKView) {
        self.size.width = 414
        self.size.height = 896
        self.backgroundColor = .white
        
        bubble.run(SKAction.hide())
        
        layout()
        action()
    }
    
    func layout() {
        
        //MARK: - Layout Background
        backgroundImg.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        self.addChild(backgroundImg)
        
        //MARK: - Layout Bubble
        bubble.position = CGPoint(x: self.frame.midX + 70, y: self.frame.midY + 80)
        self.addChild(bubble)
        
        //MARK: - Layout Text
        textContainer.position = CGPoint(x: self.frame.midX, y: self.frame.midY - 320)
        textContainer.preferredMaxLayoutWidth = self.size.width - 60
        addChild(textContainer)
        
    }
    
    func action() {
        let sequence = SKAction.sequence([SKAction.fadeAlpha(to: 0, duration: 0.1), SKAction.unhide(), SKAction.wait(forDuration: 1), SKAction.fadeAlpha(to: 1, duration: 2)])
        bubble.run(sequence)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard touches.first?.location(in: self) != nil else { return }
        
        let story14 = Story14()
        let transition = SKTransition.moveIn(with: .down, duration: 1)
        view?.presentScene(story14, transition: transition)
    }
}
