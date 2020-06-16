//
//  Story9.swift
//  Coco
//
//  Created by Muhammad Faruuq Qayyum on 14/06/20.
//  Copyright © 2020 Apple Academy. All rights reserved.
//

import SpriteKit
import GameplayKit

class Story9: SKScene {
    
    let backgroundImage: SKSpriteNode = {
        let img = SKSpriteNode(imageNamed: "View 9")
        return img
    }()
    
    let moon: SKSpriteNode = {
        let moon = SKSpriteNode(imageNamed: "Full Moon")
        moon.setScale(0.4)
        moon.zPosition = 2
        return moon
    }()
    
    let textContainer1: SKLabelNode = {
        let text = SKLabelNode(fontNamed: "Chalkduster")
        text.text = "Without realizing it, it turns out that time goes so fast. "
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
        text.text = "It was getting late and Coco had to find a place to rest."
        text.fontSize = 20
        text.fontColor = .white
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
        self.backgroundColor = .systemGreen
        
        layout()
        animation()
    }
    
    func layout() {
        let midX = self.frame.midX
        let midY = self.frame.midY
        
        backgroundImage.position = CGPoint(x: midX, y: midY)
        addChild(backgroundImage)
        
        moon.position = CGPoint(x: midX, y: self.frame.maxY - 40)
        addChild(moon)
        
        textContainer1.position = CGPoint(x: midX, y: self.frame.minY + 200)
        textContainer1.preferredMaxLayoutWidth = self.size.width - 50
        addChild(textContainer1)
        
        textContainer2.position = CGPoint(x: midX, y: textContainer1.frame.minY - 70)
        textContainer2.preferredMaxLayoutWidth = self.size.width - 50
        addChild(textContainer2)
        
    }
    
    func animation() {
        moon.run(SKAction.moveTo(y: self.frame.maxY - 130, duration: 1))
    }
    
}
