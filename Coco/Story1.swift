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
    
    override func didMove(to view: SKView) {
        
        self.size.width = 414
        self.size.height = 896
        self.backgroundColor = .white
        layout()
    }
    
    func layout() {
        seaImage.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        seaImage.size = CGSize(width: self.frame.width, height: self.frame.height)
        addChild(seaImage)
    }
    
}
