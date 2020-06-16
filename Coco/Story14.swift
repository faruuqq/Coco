//
//  Story14.swift
//  Coco
//
//  Created by Muhammad Faruuq Qayyum on 16/06/20.
//  Copyright © 2020 Apple Academy. All rights reserved.
//

import SpriteKit
import GameplayKit

class Story14: SKScene {
    
    let backgroundImg: SKSpriteNode = {
        let img = SKSpriteNode(imageNamed: "View 14")
        return img
    }()
    
    let questionMark = [
    SKSpriteNode(imageNamed: "Question Mark"),
    SKSpriteNode(imageNamed: "Question Mark"),
    SKSpriteNode(imageNamed: "Question Mark")
    ]
    
    let text: SKLabelNode = {
        let text = SKLabelNode()
        text.text = "Then, he began to search and finally he found a coconut tree. He tried to climb the tree, but it turned out to be too high.\n\nHe then shook the tree until the coconut fruit fell and could be drunk."
        text.fontSize = 22
        text.fontName = "Chalkduster"
        text.fontColor = .black
        text.numberOfLines = 0
        text.lineBreakMode = .byWordWrapping
        text.zPosition = 1
        return text
    }()
    
    //MARK: - DidMove
    override func didMove(to view: SKView) {
        self.size.width = 414
        self.size.height = 896
        layout()
        
        for item in questionMark {
            item.setScale(0.02)
            item.zPosition = 1
            item.run(SKAction.hide())
        }
        
        animations()
    }
    
    func layout() {
        let midX = self.frame.midX
        let midY = self.frame.midY
        
        backgroundImg.position = CGPoint(x: midX, y: midY)
        addChild(backgroundImg)
        
        questionMark[0].position = CGPoint(x: midX - 35, y: midY + 70)
        questionMark[0].zRotation = -0.3
        addChild(questionMark[0])
        
        questionMark[1].position = CGPoint(x: midX - 100, y: midY + 120)
        addChild(questionMark[1])
        
        questionMark[2].position = CGPoint(x: self.frame.minX + 35, y: midY + 90)
        questionMark[2].zRotation = 0.3
        addChild(questionMark[2])
        
        text.position = CGPoint(x: midX, y: self.frame.minY + 80)
        text.preferredMaxLayoutWidth = self.frame.width - 40
        addChild(text)
    }
    
    func animations() {
        let sequence = SKAction.sequence([SKAction.fadeAlpha(to: 0, duration: 0.1), SKAction.unhide(), SKAction.wait(forDuration: 1), SKAction.fadeAlpha(to: 1, duration: 2)])
        questionMark[0].run(sequence)
        questionMark[1].run(sequence)
        questionMark[2].run(sequence)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard touches.first != nil else { return }
        
        let story15 = Story15()
        let transition = SKTransition.push(with: .down, duration: 1)
        view?.presentScene(story15, transition: transition)
        
    }
}
