//
//  Story3.swift
//  Coco
//
//  Created by Muhammad Faruuq Qayyum on 12/06/20.
//  Copyright © 2020 Apple Academy. All rights reserved.
//

import SpriteKit
import GameplayKit

class Story3: SKScene {
    
    let background: SKSpriteNode = {
        let background = SKSpriteNode(imageNamed: "View 3")
        return background
    }()
    
    let coco: SKSpriteNode = {
        let coco = SKSpriteNode(imageNamed: "Coco (1)")
        coco.setScale(0.08)
        coco.zPosition = 2
        return coco
    }()
    
    let textContainer: SKLabelNode = {
        let text = SKLabelNode()
        let attributedText = NSMutableAttributedString(string: "Coco woke up on an island that was foreign to him. He felt confused, frightened, and panicked because he could not find anyone other than him on the island. Let's help him to find people", attributes: [NSAttributedString.Key.font : UIFont(name: "Chalkduster", size: 25)!])
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
        
        layout()
        cocoAction()
    }
    
    func layout() {
        
        //MARK: - Layout Background
        background.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        self.addChild(background)
        
        //MARK: - Layout Coco
        coco.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        self.addChild(coco)
        
        //MARK: - Layout Text
        textContainer.preferredMaxLayoutWidth = self.size.width - 40
        textContainer.position = CGPoint(x: self.frame.midX, y: self.frame.maxY - 300)
        self.addChild(textContainer)
    }
    
    //MARK: - Animations
    func cocoAction() {
        var texture = [SKTexture]()
        for i in 1...5 {
            texture.append(SKTexture(imageNamed: "Coco (\(i))"))
        }
        let action = SKAction.animate(with: texture, timePerFrame: 0.4)
        let sequence = SKAction.sequence([action, action.reversed()])
        coco.run(SKAction.repeatForever(sequence))
    }
    
    //MARK: - Touch Began
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard touches.first != nil else { return }
        
        let story4a = Story4a()
        let transition = SKTransition.moveIn(with: .down, duration: 1)
        view?.presentScene(story4a, transition: transition)
        
    }
}
