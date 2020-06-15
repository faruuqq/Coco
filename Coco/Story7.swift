//
//  Story7.swift
//  Coco
//
//  Created by Muhammad Faruuq Qayyum on 13/06/20.
//  Copyright © 2020 Apple Academy. All rights reserved.
//

import SpriteKit
import GameplayKit

class Story7: SKScene {
    
    let backgroundImage: SKSpriteNode = {
        let background = SKSpriteNode(imageNamed: "View 7")
        return background
    }()
    
    let textContainer1: SKLabelNode = {
        let text = SKLabelNode(fontNamed: "Chalkduster")
        text.text = "Therefore, he began to look for food and find ways how to cook it."
        text.fontSize = 20
        text.fontColor = .white
        text.numberOfLines = 0
        text.horizontalAlignmentMode = .center
        text.lineBreakMode = .byWordWrapping
        text.zPosition = 2
        return text
    }()
    
    let textContainer2: SKLabelNode = {
        let text = SKLabelNode(fontNamed: "Chalkduster")
        text.text = "Towards night, Coco succeed to light a fire to cook the food he got and eat until he was full."
        text.fontSize = 18
        text.fontColor = .white
        text.numberOfLines = 0
        text.horizontalAlignmentMode = .center
        text.lineBreakMode = .byWordWrapping
        text.zPosition = 2
        return text
    }()
    
    let moon: SKSpriteNode = {
        let moon = SKSpriteNode(imageNamed: "Moon")
        moon.setScale(0.05)
        moon.zPosition = 1
        moon.alpha = 0.7
        return moon
    }()
    
    
    
    //MARK: - DidMode
    override func didMove(to view: SKView) {
        self.size.width = 414
        self.size.height = 896
        self.backgroundColor = .systemGreen
        
        layout()
        actionAnimation()
    }
    
    //MARK: - Layout
    func layout() {
        backgroundImage.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        addChild(backgroundImage)
        
        textContainer1.position = CGPoint(x: self.frame.midX, y: self.frame.midY + 300)
        textContainer1.preferredMaxLayoutWidth = self.size.width - 70
        addChild(textContainer1)
        
        textContainer2.position = CGPoint(x: self.frame.midX + 60, y: textContainer1.position.y - 120)
        textContainer2.preferredMaxLayoutWidth = self.size.width - 120
        addChild(textContainer2)
        
        moon.position = CGPoint(x: self.frame.minX + 70, y: self.frame.maxY + 50)
        addChild(moon)
    }
    
    //MARK: - Animations
    func actionAnimation() {
        let sequence = SKAction.sequence([SKAction.moveTo(y: self.frame.midY + 180, duration: 1), SKAction.fadeAlpha(to: 1, duration: 0.5)])
        moon.run(sequence)
    }
    
    //MARK: - Touch Interaction
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard touches.first?.location(in: self) != nil else { return }
        
        let story8 = Story8()
        let transition = SKTransition.push(with: .right, duration: 1)
        view?.presentScene(story8, transition: transition)
    }
    
}
