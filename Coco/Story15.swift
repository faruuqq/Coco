//
//  Story15.swift
//  Coco
//
//  Created by Muhammad Faruuq Qayyum on 16/06/20.
//  Copyright © 2020 Apple Academy. All rights reserved.
//

import SpriteKit
import GameplayKit

class Story15: SKScene {
    
    var score = 0
    let greenCoconutCategory: UInt32 = 0b01 //1
    let darkCoconutCategory: UInt32 = 0b10 // 2
    let basketCategory: UInt32 = 0b11 //3
    
    let background: SKSpriteNode = {
        let background = SKSpriteNode(imageNamed: "View 15")
        return background
    }()
    
    let scoreLabel: SKLabelNode = {
        let scoreLabel = SKLabelNode(fontNamed: "Chalkduster")
        scoreLabel.fontSize = 28
        scoreLabel.zPosition = 1
        scoreLabel.horizontalAlignmentMode = .center
        scoreLabel.fontColor = .black
        return scoreLabel
    }()
    
    let coco: SKSpriteNode = {
        let coco = SKSpriteNode(imageNamed: "Coco")
        coco.setScale(0.02)
        coco.zPosition = 1
        return coco
    }()
    
    let basket: SKSpriteNode = {
        let basket = SKSpriteNode(imageNamed: "Basket")
        basket.zPosition = 1
        basket.setScale(0.1)
        return basket
    }()
    
    let wellDone: SKSpriteNode = {
        let img = SKSpriteNode(imageNamed: "Well Done")
        img.zPosition = 2
        img.setScale(0.35)
        return img
    }()
    
    let sureThing: SKSpriteNode = {
        let btn = SKSpriteNode(imageNamed: "Ok Button")
        btn.zPosition = 3
        btn.setScale(0.4)
        return btn
    }()
    
    //MARK: - DidMove
    override func didMove(to view: SKView) {
        self.size.width = 414
        self.size.height = 896
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: self.frame)
        physicsWorld.contactDelegate = self
        wellDone.run(SKAction.hide())
        sureThing.run(SKAction.hide())
        
        layout()
        actionCoconuts()
    }
    
    func layout() {
        let midX = self.frame.midX
        let midY = self.frame.midY
        
        background.position = CGPoint(x: midX, y: midY)
        addChild(background)
        
        scoreLabel.position = CGPoint(x: midX, y: self.frame.maxY - 90)
        scoreLabel.text = "Score \(score)"
        addChild(scoreLabel)
        
        coco.position = CGPoint(x: midX, y: self.frame.minY + 90)
        addChild(coco)
        
        basket.position = CGPoint(x: self.frame.minX + 30, y: coco.frame.maxY + 50)
        addChild(basket)
        basket.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: basket.size.width, height: 25))
        basket.physicsBody?.affectedByGravity = false
        basket.physicsBody?.allowsRotation = false
        basket.physicsBody?.isDynamic = false
        basket.physicsBody?.categoryBitMask = basketCategory
        basket.physicsBody?.collisionBitMask = greenCoconutCategory
        basket.physicsBody?.contactTestBitMask = greenCoconutCategory
        basket.name = "basket"
        
        wellDone.position = CGPoint(x: midX, y: midY)
        addChild(wellDone)
        
        sureThing.position = CGPoint(x: midX, y: midY - 40)
        addChild(sureThing)
    }
    
    func spawnGreenCoconut() {
        let greenCoconut = SKSpriteNode(imageNamed: "Coconut (2)")
        greenCoconut.zPosition = 1
        greenCoconut.setScale(0.07)
        greenCoconut.position = CGPoint(x: CGFloat.random(in: -300...300), y: self.frame.maxY - 100)
        greenCoconut.physicsBody = SKPhysicsBody(rectangleOf: greenCoconut.size)
        greenCoconut.physicsBody?.allowsRotation = false
        greenCoconut.physicsBody?.affectedByGravity = false
        greenCoconut.physicsBody?.categoryBitMask = greenCoconutCategory
        greenCoconut.physicsBody?.collisionBitMask = basketCategory
        greenCoconut.physicsBody?.contactTestBitMask = basketCategory
        greenCoconut.name = "greenCoconut"
        addChild(greenCoconut)
        
        let action1 = SKAction.moveTo(y: self.frame.minY, duration: 1)
        let sequence = SKAction.sequence([action1, SKAction.removeFromParent()])
        greenCoconut.run(sequence)
    }
    
    func spawnDarkCoconut() {
        let darkCoconut = SKSpriteNode(imageNamed: "Coconut (1)")
        darkCoconut.zPosition = 1
        darkCoconut.setScale(0.04)
        darkCoconut.position = CGPoint(x: CGFloat.random(in: -300...300), y: CGFloat.random(in: 100...700))
        addChild(darkCoconut)
        
        let moveAction = SKAction.moveTo(y: self.frame.minY, duration: 1)
        let sequence = SKAction.sequence([moveAction, SKAction.removeFromParent()])
        darkCoconut.run(sequence)
    }
    
    func actionCoconuts() {
        let spawnCocos = SKAction.run {
            self.spawnDarkCoconut()
            self.spawnGreenCoconut()
        }

        run(SKAction.repeatForever(SKAction.sequence([spawnCocos, SKAction.wait(forDuration: 1)])))
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard touches.first != nil else { return }
        
        guard let touchLocation = touches.first?.location(in: self) else { return }
        if sureThing.contains(touchLocation) {
            let story7 = Story7()
            let transition = SKTransition.push(with: .down, duration: 1)
            view?.presentScene(story7, transition: transition)
        }
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {
            let touchLocation = t.location(in: self)
            
            if coco.contains(touchLocation) {
                coco.run(SKAction.move(to: touchLocation, duration: 0.01))
            } else if basket.contains(touchLocation) {
                basket.position = touchLocation
            }
        }
    }

}

extension Story15: SKPhysicsContactDelegate {
    func didBegin(_ contact: SKPhysicsContact) {
        
        let greenCoco = contact.bodyA.node?.name == "greenCoconut" ? contact.bodyA.node : contact.bodyB.node
        
        if score == 4 {
            wellDone.run(SKAction.unhide())
            sureThing.run(SKAction.unhide())
            basket.run(SKAction.hide())
        }
        
        var firstBody = SKPhysicsBody()
        var secondBody = SKPhysicsBody()
        
        if contact.bodyA.node!.name == "greenCoconut" {
            firstBody = contact.bodyA
            secondBody = contact.bodyB
        } else {
            firstBody = contact.bodyB
            secondBody = contact.bodyA
        }
        
        if firstBody.node!.name == "greenCoconut" && secondBody.node!.name == "basket" {
            print("contact detected")
            score += 1
            print(score)
            scoreLabel.text = "Score \(score)"
            greenCoco?.run(SKAction.removeFromParent())
        }
    }
    
}
