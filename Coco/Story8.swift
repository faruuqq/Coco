//
//  Story8.swift
//  Coco
//
//  Created by Muhammad Faruuq Qayyum on 14/06/20.
//  Copyright © 2020 Apple Academy. All rights reserved.
//

import SpriteKit
import GameplayKit

class Story8: SKScene {
    
    let kayuCategoryMask: UInt32 = 0b01 //1
    let apiCategoryMask: UInt32 = 0b10 //2
    let ikanCategoryMask: UInt32 = 0b11 //3
    
    let backgroundImage: SKSpriteNode = {
        let background = SKSpriteNode(imageNamed: "View 8")
        return background
    }()
    
    let hint: SKSpriteNode = {
        let hint = SKSpriteNode(imageNamed: "Hint")
        hint.setScale(0.4)
        hint.zPosition = 3
        return hint
    }()
    
    let btn: SKSpriteNode = {
        let btn = SKSpriteNode(imageNamed: "Ok Button")
        btn.zPosition = 4
        btn.setScale(0.4)
        return btn
    }()
    
    let kayu: SKSpriteNode = {
        let kayuTexture = SKTexture(imageNamed: "Kayu")
        let kayu = SKSpriteNode(texture: kayuTexture)
        kayu.setScale(0.2)
        kayu.zPosition = 1
        kayu.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 80, height: 80))
        kayu.physicsBody?.allowsRotation = false
        kayu.physicsBody?.affectedByGravity = false
        return kayu
    }()
    
    let api: SKSpriteNode = {
        let api = SKSpriteNode(imageNamed: "Api")
        api.setScale(0.2)
        api.zPosition = 2
        api.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 80, height: 80))
        api.physicsBody?.allowsRotation = false
        api.physicsBody?.affectedByGravity = false
        return api
    }()
    
    let ikan: SKSpriteNode = {
        let ikan = SKSpriteNode(imageNamed: "Ikan (1)")
        ikan.setScale(0.2)
        ikan.zPosition = 2
        ikan.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 80, height: 80))
        ikan.physicsBody?.affectedByGravity = false
        ikan.physicsBody?.allowsRotation = false
        return ikan
    }()
    
    let wellDone: SKSpriteNode = {
        let wellDone = SKSpriteNode(imageNamed: "Well Done")
        wellDone.setScale(0.4)
        wellDone.zPosition = 3
        return wellDone
    }()
    
    let nextSceneBtn: SKSpriteNode = {
        let btn = SKSpriteNode(imageNamed: "Ok Button")
        btn.zPosition = 5
        btn.setScale(0.4)
        return btn
    }()
    
    //MARK: - DidMove
    override func didMove(to view: SKView) {
        self.size.width = 414
        self.size.height = 896
        self.backgroundColor = .systemGreen
        
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: self.frame)
        physicsWorld.contactDelegate = self
        
        layout()
    }
    
    func layout() {
        let midX = self.frame.midX
        let midY = self.frame.midY
        
        //MARK: - Layout Background
        backgroundImage.position = CGPoint(x: midX, y: midY)
        addChild(backgroundImage)
        
        //MARK: - Layout Hint
        hint.position = CGPoint(x: midX, y: midY)
        addChild(hint)
        
        //MARK: - Layout Button
        btn.position = CGPoint(x: midX, y: midY - 70)
        addChild(btn)
        
        //MARK: - Layout Kayu
        kayu.position = CGPoint(x: midX - 100, y: midY + 100)
        kayu.name = "kayu"
        addChild(kayu)
        
        //MARK: - Layout Api
        api.position = CGPoint(x: midX + 100, y: midY - 100)
        api.name = "api"
        addChild(api)
        api.physicsBody?.categoryBitMask = apiCategoryMask
        api.physicsBody?.collisionBitMask = ikanCategoryMask
        api.physicsBody?.contactTestBitMask = ikanCategoryMask
        
        //MARK: - Layout Ikan
        ikan.position = CGPoint(x: self.frame.minX + 80, y: self.frame.minY + 80)
        ikan.name = "ikan"
        addChild(ikan)
        ikan.physicsBody?.categoryBitMask = ikanCategoryMask
        ikan.physicsBody?.collisionBitMask = apiCategoryMask
        ikan.physicsBody?.contactTestBitMask = apiCategoryMask
        
        //MARK: - Layout Well Done
        wellDone.position = CGPoint(x: midX, y: midY)
        wellDone.run(SKAction.hide())
        addChild(wellDone)
        
        nextSceneBtn.position = CGPoint(x: midX, y: midY - 70)
        nextSceneBtn.run(SKAction.hide())
        addChild(nextSceneBtn)
    }
    
    //MARK: - Touch Interaction
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for t in touches {
            if kayu.contains(t.location(in: self)) {
                kayu.position = t.location(in: self)
            } else if api.contains(t.location(in: self)) {
                api.position = t.location(in: self)
            } else if ikan.contains(t.location(in: self)) {
                ikan.position = t.location(in: self)
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard touches.first != nil else { return }
        
        if kayu.contains((touches.first?.location(in: self))!) {
            kayu.setScale(0.25)
        } else if api.contains((touches.first?.location(in: self))!) {
            api.setScale(0.25)
        } else if ikan.contains((touches.first?.location(in: self))!) {
            ikan.setScale(0.25)
        } else if btn.contains((touches.first?.location(in: self))!) {
            hint.run(SKAction.hide())
            btn.run(SKAction.hide())
        } else if nextSceneBtn.contains((touches.first?.location(in: self))!) {
            print("nextbtn got tapped")
            let story9 = Story9()
            view?.presentScene(story9, transition: SKTransition.push(with: .down, duration: 1))
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if kayu.contains((touches.first?.location(in: self))!) {
            kayu.setScale(0.2)
        } else if api.contains((touches.first?.location(in: self))!) {
            api.setScale(0.2)
        } else if ikan.contains((touches.first?.location(in: self))!) {
            ikan.setScale(0.2)
        }
    }
}

extension Story8: SKPhysicsContactDelegate {
    
    func didBegin(_ contact: SKPhysicsContact) {
        let contactMask = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
        if contactMask == ikan.physicsBody!.categoryBitMask | api.physicsBody!.categoryBitMask {
            print("ikan and api contacted")
            let sequence = SKAction.sequence([SKAction.wait(forDuration: 1), SKAction.animate(with: [SKTexture(imageNamed: "Ikan (2)")], timePerFrame: 0.1), SKAction.wait(forDuration: 2), SKAction.colorize(with: .systemOrange, colorBlendFactor: 0.8, duration: 1)])
            ikan.run(sequence)
        }
    }
    
    func didEnd(_ contact: SKPhysicsContact) {
        wellDone.run(SKAction.sequence([SKAction.wait(forDuration: 4), SKAction.unhide()]))
        nextSceneBtn.run(SKAction.sequence([SKAction.wait(forDuration: 4), SKAction.unhide()]))
    }
}
