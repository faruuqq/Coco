//
//  Story1.swift
//  Coco
//
//  Created by Muhammad Faruuq Qayyum on 12/06/20.
//  Copyright © 2020 Apple Academy. All rights reserved.
//

// frame size 11pro = w: 750 h: 1334
// frame size 11 = w:414 h: 896

/*anchor point: 0.5 , 0.5
 minX: -207.0
 midX: 0.0
 maxX: 207.0
 minY: -448.0
 midY: 0.0
 maxY: 448.0
 */

/*anchor point: 0.0, 0.0
 minX: -0.0
 midX: 207.0
 maxX: 414.0
 minY: -0.0
 midY: 448.0
 maxY: 896.0
 */

import SpriteKit
import GameplayKit

class Story1B: SKScene {
    
    let seaImage: SKSpriteNode = {
        let seaImage = SKSpriteNode(imageNamed: "MainImage(1)")
        seaImage.setScale(0.1)
        seaImage.zPosition = -1
        return seaImage
        
    }()
    
    override func didMove(to view: SKView) {
        backgroundLayout()
        self.backgroundColor = .white
    }
    
    func backgroundLayout() {
        
        //        let seaImage = SKSpriteNode(imageNamed: "MainImage(1)")
        //        seaImage.anchorPoint = CGPoint(x: 0.5, y: 0)
                seaImage.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        //        seaImage.setScale(1.5)
        //        seaImage.zPosition = -1
        self.addChild(seaImage)
        
        let cloud1 = SKSpriteNode(imageNamed: "Awan (1)")
        let x = CGFloat.random(in: 0...750)
        cloud1.position = CGPoint(x: x, y: self.frame.maxY - 180)
        //        cloud1.position = CGPoint(x: self.frame.minX + 20, y: self.frame.maxY - 180)
        self.addChild(cloud1)
        
        
        let cloud2 = SKSpriteNode(imageNamed: "Awan (2)")
        cloud2.position = CGPoint(x: x, y: self.frame.maxY - 300)
        //        cloud2.anchorPoint = CGPoint(x: 1, y: 0.5)
        //        cloud2.position = CGPoint(x: self.frame.maxX - 20, y: self.frame.maxY - 300)
        self.addChild(cloud2)
        
        let moveAction = SKAction.moveBy(x: 100, y: 0, duration: 1)
        let sequenceAction = SKAction.sequence([moveAction])
        cloud1.run(SKAction.repeatForever(SKAction.reversed(sequenceAction)()))
        cloud2.run(sequenceAction)
        
        //next:
        //1. set animation move to minX and maxX
        //2. reverse after reaching those points
        
        
        let textContainer = SKLabelNode()
        let attributedText = NSMutableAttributedString(string: "Coco and his parents are traveling to his private island.", attributes: [NSAttributedString.Key.font : UIFont(name: "Chalkduster", size: 32) ?? UIFont.systemFont(ofSize: 32, weight: .semibold)])
        attributedText.append(NSAttributedString(string: "\n\nBut in the middle of the trip to the island, there was a very big storm.", attributes: [NSAttributedString.Key.font : UIFont(name: "Chalkduster", size: 32) ?? UIFont.systemFont(ofSize: 32, weight: .semibold)]))
        textContainer.attributedText = attributedText
        textContainer.position = CGPoint(x: self.frame.midX, y: self.frame.midY - 400)
        textContainer.numberOfLines = 0
        textContainer.horizontalAlignmentMode = .center
        textContainer.lineBreakMode = .byWordWrapping
        textContainer.preferredMaxLayoutWidth = self.frame.width - 300
        self.addChild(textContainer)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard touches.first != nil else { return }
        
        //go to next screen
    }
    
}

