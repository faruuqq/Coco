//
//  Story10.swift
//  Coco
//
//  Created by Muhammad Faruuq Qayyum on 16/06/20.
//  Copyright © 2020 Apple Academy. All rights reserved.
//

import SpriteKit
import GameplayKit

class Story10: SKScene {
    
    let backgroundImg: SKSpriteNode = {
        let img = SKSpriteNode(imageNamed: "View 10")
        return img
    }()
    
    let tree1: SKSpriteNode = {
        let img = SKSpriteNode(imageNamed: "Tree (1)")
        img.zPosition = 1
        img.setScale(0.16)
        return img
    }()
    
    let tree2: SKSpriteNode = {
        let img = SKSpriteNode(imageNamed: "Tree (2)")
        img.zPosition = 1
        img.setScale(0.16)
        return img
    }()
    
    let text: SKLabelNode = {
        let text = SKLabelNode()
        text.text = "Many places are available, but there is a lot of trash there.\n\nTherefore, Coco must clean it first and separate the trash."
        text.zPosition = 1
        text.lineBreakMode = .byWordWrapping
        text.numberOfLines = 0
        text.fontSize = 22
        text.fontName = "Chalkduster"
        text.fontColor = .white
        return text
    }()
    
    let container: SKSpriteNode = {
        let view = SKSpriteNode()
        view.zPosition = 2
        view.alpha = 0.85
        view.color = .white
        return view
    }()
    
    let toBeContinue: SKLabelNode = {
        let text = SKLabelNode()
        text.text = "To be continued ... \n\n\nCongratulation for keeping alive in the first day!"
        text.lineBreakMode = .byWordWrapping
        text.numberOfLines = 0
        text.fontName = "Chalkduster"
        text.fontColor = .black
        text.fontSize = 25
        text.zPosition = 2
        return text
    }()
    
    override func didMove(to view: SKView) {
        self.size.width = 414
        self.size.height = 896
        container.run(SKAction.hide())
        toBeContinue.run(SKAction.hide())
        layout()
    }
    
    func layout() {
        let midX = self.frame.midX
        let midY = self.frame.midY
        
        backgroundImg.position = CGPoint(x: midX, y: midY)
        addChild(backgroundImg)
        
        tree1.position = CGPoint(x: self.frame.maxX - 20, y:midY + 100)
        addChild(tree1)
        
        tree2.position = CGPoint(x: self.frame.minX + 20, y: midY + 150)
        addChild(tree2)
        
        text.position = CGPoint(x: midX, y: self.frame.minY + 100)
        text.preferredMaxLayoutWidth = self.frame.width - 40
        addChild(text)
        
        container.size = CGSize(width: self.size.width - 60, height: self.size.height - 200)
        container.position = CGPoint(x: midX, y: midY)
        addChild(container)
        
        toBeContinue.position = CGPoint(x: midX, y: midY)
        toBeContinue.preferredMaxLayoutWidth = self.size.width - 80
        addChild(toBeContinue)
    }
    
    func animations() {
        container.run(SKAction.unhide())
        toBeContinue.run(SKAction.unhide())
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard touches.first != nil else { return }
        
        run(SKAction.run {
            self.animations()
        })
    }
    
    
}
