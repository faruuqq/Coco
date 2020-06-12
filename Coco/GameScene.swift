//
//  GameScene.swift
//  Coco
//
//  Created by Muhammad Faruuq Qayyum on 11/06/20.
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

class GameScene: SKScene {
    
    let playBtn: SKSpriteNode = {
        let playBtn = SKSpriteNode(imageNamed: "Play_button")
        playBtn.setScale(0.15)
        return playBtn
    }()
    
    let background: SKSpriteNode = {
        let background = SKSpriteNode(imageNamed: "Opening_background")
        background.zPosition = -1
        return background
    }()
    
    override func didMove(to view: SKView) {
        layout()
    }
    
    func layout() {
        
        //MARK: - Background Layout
        background.size = CGSize(width: self.frame.width, height: self.frame.height)
        self.addChild(background)
        
        //MARK: - Button Play Layout
        playBtn.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        self.addChild(playBtn)
        
        let scaleBig = SKAction.scale(to: 0.18, duration: 0.5)
        let scaleBigReverse = SKAction.scale(to: 0.15, duration: 0.5)
        let sequenceAction = SKAction.sequence([scaleBig, scaleBigReverse])
        playBtn.run(SKAction.repeatForever(sequenceAction))
    }
    
    //MARK: - Touch Began
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard touches.first != nil else { return }
        
        if playBtn.frame.contains((touches.first?.location(in: self))!) {
            let story1 = Story1()
            story1.scaleMode = scaleMode
            let transition = SKTransition.fade(withDuration: 0.5)
            self.view?.presentScene(story1, transition: transition)
        }
        
    }
    
}
