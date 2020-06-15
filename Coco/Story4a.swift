//
//  Story4a.swift
//  Coco
//
//  Created by Muhammad Faruuq Qayyum on 15/06/20.
//  Copyright © 2020 Apple Academy. All rights reserved.
//
import SpriteKit
import GameplayKit

class Story4a: SKScene {
    
    var gotSelectedA = false
    var gotSelectedB = false
    var totalSelected = 0
    var assign1 = false
    var assign2 = false
    var assign3 = false
    var assign4 = false
    var assign5 = false
    var assign6 = false
    var assign7 = false
    var assign8 = false
    var assign9 = false
    
    let background: SKSpriteNode = {
        let background = SKSpriteNode(imageNamed: "View 4-5")
        return background
    }()
    
    let puzzle = [
        SKSpriteNode(imageNamed: "Puzzle (1)"),
        SKSpriteNode(imageNamed: "Puzzle (2)"),
        SKSpriteNode(imageNamed: "Puzzle (3)"),
        SKSpriteNode(imageNamed: "Puzzle (4)"),
        SKSpriteNode(imageNamed: "Puzzle (5)"),
        SKSpriteNode(imageNamed: "Puzzle (6)"),
        SKSpriteNode(imageNamed: "Puzzle (7)"),
        SKSpriteNode(imageNamed: "Puzzle (8)"),
        SKSpriteNode(imageNamed: "Puzzle (9)"),
    ]
    
    override func didMove(to view: SKView) {
        self.size.width = 414
        self.size.height = 896
        layout()
    }
    
    func layout() {
        
        let midX = self.frame.midX
        let midY = self.frame.midY
        
        let puzzlePosition = [
        CGPoint(x: self.frame.midX - 120, y: self.frame.midY + 120),
        CGPoint(x: self.frame.midX, y: self.frame.midY + 120),
        CGPoint(x: self.frame.midX + 120, y: self.frame.midY + 120),
        CGPoint(x: self.frame.midX - 120, y: self.frame.midY),
        CGPoint(x: self.frame.midX, y: self.frame.midY),
        CGPoint(x: self.frame.midX + 120, y: self.frame.midY),
        CGPoint(x: self.frame.midX - 120, y: self.frame.midY - 120),
        CGPoint(x: self.frame.midX, y: self.frame.midY - 120),
        CGPoint(x: self.frame.midX + 120, y: self.frame.midY - 120)
        ]
        
        background.position = CGPoint(x: midX, y: midY)
        addChild(background)
        
        for item in puzzle {
            item.setScale(0.4)
            addChild(item)
        }
        
        puzzle[0].position = puzzlePosition[0]
        puzzle[1].position = puzzlePosition[1]
        puzzle[2].position = puzzlePosition[2]
        puzzle[3].position = puzzlePosition[3]
        puzzle[4].position = puzzlePosition[4]
        puzzle[5].position = puzzlePosition[5]
        puzzle[6].position = puzzlePosition[6]
        puzzle[7].position = puzzlePosition[7]
        puzzle[8].position = puzzlePosition[8]

    }
    
    func animation() {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let scaleBig = SKAction.scale(to: 0.42, duration: 0.5)
        let scaleNormal = SKAction.scale(to: 0.4, duration: 0.5)
        
        let touchLocation = (touches.first?.location(in: self))!
        
        //puzzle 1
        if puzzle[0].contains(touchLocation) {
            if totalSelected <= 2 && assign1 != true {
                assign1 = true
                print("assign 1 selected")
                totalSelected += 1
                print("total selected = \(totalSelected)")
                puzzle[0].run(scaleBig)
            } else if totalSelected <= 2 && assign1 != false {
                assign1 = false
                print("assign 1 diselected")
                totalSelected -= 1
                print("total selected = \(totalSelected)")
                puzzle[0].run(scaleNormal)
            }
            
         //puzzle 2
        } else if puzzle[1].contains(touchLocation) {
            if totalSelected <= 2 && assign2 != true {
                assign2 = true
                print("assign 2 selected")
                totalSelected += 1
                print("total selected = \(totalSelected)")
                puzzle[1].run(scaleBig)
            } else if totalSelected <= 2 && assign2 != false {
                assign1 = false
                print("assign 2 diselected")
                totalSelected -= 1
                print("total selected = \(totalSelected)")
                puzzle[1].run(scaleNormal)
            }
            
        //puzzle 3
        } else if puzzle[2].contains(touchLocation) {
            if totalSelected <= 2 && assign3 != true {
                assign3 = true
                print("assign 3 selected")
                totalSelected += 1
                print("total selected = \(totalSelected)")
                puzzle[2].run(scaleBig)
            } else if totalSelected <= 2 && assign3 != false {
                assign3 = false
                print("assign 3 diselected")
                totalSelected -= 1
                print("total selected = \(totalSelected)")
                puzzle[2].run(scaleNormal)
            }
            
        //puzzle 4
        } else if puzzle[3].contains(touchLocation) {
            if totalSelected <= 2 && assign4 != true {
                assign4 = true
                print("assign 4 selected")
                totalSelected += 1
                print("total selected = \(totalSelected)")
                puzzle[3].run(scaleBig)
            } else if totalSelected <= 2 && assign4 != false {
                assign4 = false
                print("assign 4 diselected")
                totalSelected -= 1
                print("total selected = \(totalSelected)")
                puzzle[3].run(scaleNormal)
            }
            
        //puzzle 5
        } else if puzzle[4].contains(touchLocation) {
            if totalSelected <= 2 && assign5 != true {
                assign5 = true
                print("assign 5 selected")
                totalSelected += 1
                print("total selected = \(totalSelected)")
                puzzle[4].run(scaleBig)
            } else if totalSelected <= 2 && assign5 != false {
                assign5 = false
                print("assign 5 diselected")
                totalSelected -= 1
                print("total selected = \(totalSelected)")
                puzzle[4].run(scaleNormal)
            }
            
        //puzzle 6
        } else if puzzle[5].contains(touchLocation) {
            if totalSelected <= 2 && assign6 != true {
                assign6 = true
                print("assign 6 selected")
                totalSelected += 1
                print("total selected = \(totalSelected)")
                puzzle[5].run(scaleBig)
            } else if totalSelected <= 2 && assign6 != false {
                assign6 = false
                print("assign 6 diselected")
                totalSelected -= 1
                print("total selected = \(totalSelected)")
                puzzle[5].run(scaleNormal)
            }
            
        //puzzle 7
        } else if puzzle[6].contains(touchLocation) {
            if totalSelected <= 2 && assign7 != true {
                assign7 = true
                print("assign 7 selected")
                totalSelected += 1
                print("total selected = \(totalSelected)")
                puzzle[6].run(scaleBig)
            } else if totalSelected <= 2 && assign7 != false {
                assign7 = false
                print("assign 7 diselected")
                totalSelected -= 1
                print("total selected = \(totalSelected)")
                puzzle[6].run(scaleNormal)
            }
            
        //puzzle 8
        } else if puzzle[7].contains(touchLocation) {
            if totalSelected <= 2 && assign8 != true {
                assign8 = true
                print("assign 8 selected")
                totalSelected += 1
                print("total selected = \(totalSelected)")
                puzzle[7].run(scaleBig)
            } else if totalSelected <= 2 && assign8 != false {
                assign8 = false
                print("assign 8 diselected")
                totalSelected -= 1
                print("total selected = \(totalSelected)")
                puzzle[7].run(scaleNormal)
            }
            
        //puzzle 9
        } else if puzzle[8].contains(touchLocation) {
            if totalSelected <= 2 && assign9 != true {
                assign9 = true
                print("assign 9 selected")
                totalSelected += 1
                print("total selected = \(totalSelected)")
                puzzle[8].run(scaleBig)
            } else if totalSelected <= 2 && assign9 != false {
                assign9 = false
                print("assign 9 diselected")
                totalSelected -= 1
                print("total selected = \(totalSelected)")
                puzzle[8].run(scaleNormal)
            }
        }
    }
    
//    override func update(_ currentTime: TimeInterval) {
//        print("update")
//    }
    
}
