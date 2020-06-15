//
//  Story4.swift
//  Coco
//
//  Created by Muhammad Faruuq Qayyum on 13/06/20.
//  Copyright © 2020 Apple Academy. All rights reserved.
//

/*
 puzzle 1 width: 80.4000015258789
 puzzle 1 height: 100.5999984741211
 */

import SpriteKit
import GameplayKit

class Story4: SKScene {
    
    var aAssign: Bool = false
    var bAssign: Bool = false
    var selected: Bool = false
    var selectedValue: Int = 0
    var pzl1Selected: Bool = false
    var pzl2Selected: Bool = false
    var pzl3Selected: Bool = false
    var pzl4Selected: Bool = false
    var pzl5Selected: Bool = false
    var pzl6Selected: Bool = false
    var pzl7Selected: Bool = false
    var pzl8Selected: Bool = false
    var pzl9Selected: Bool = false
    var currentPzl1 = 0
    var currentPzl2 = 0
    var currentPzl3 = 0
    var currentPzl4 = 0
    var currentPzl5 = 0
    var currentPzl6 = 0
    var currentPzl7 = 0
    var currentPzl8 = 0
    var currentPzl9 = 0
    
    let background: SKSpriteNode = {
        let background = SKSpriteNode(imageNamed: "View 4-5")
        return background
    }()
    
    let puzzle1: SKSpriteNode = {
        let puzzle = SKSpriteNode(imageNamed: "Puzzle(1)")
        puzzle.setScale(0.2)
        puzzle.zPosition = 2
        return puzzle
    }()
    
    let puzzle2: SKSpriteNode = {
        let puzzle = SKSpriteNode(imageNamed: "Puzzle(2)")
        puzzle.setScale(0.2)
        puzzle.zPosition = 2
        return puzzle
    }()
    
    let puzzle3: SKSpriteNode = {
        let puzzle = SKSpriteNode(imageNamed: "Puzzle(3)")
        puzzle.setScale(0.2)
        puzzle.zPosition = 2
        return puzzle
    }()
    
    let puzzle4: SKSpriteNode = {
        let puzzle = SKSpriteNode(imageNamed: "Puzzle(4)")
        puzzle.setScale(0.2)
        puzzle.zPosition = 2
        return puzzle
    }()
    
    let puzzle5: SKSpriteNode = {
        let puzzle = SKSpriteNode(imageNamed: "Puzzle(5)")
        puzzle.setScale(0.2)
        puzzle.zPosition = 2
        return puzzle
    }()
    
    let puzzle6: SKSpriteNode = {
        let puzzle = SKSpriteNode(imageNamed: "Puzzle(6)")
        puzzle.setScale(0.2)
        puzzle.zPosition = 2
        return puzzle
    }()
    
    let puzzle7: SKSpriteNode = {
        let puzzle = SKSpriteNode(imageNamed: "Puzzle(7)")
        puzzle.setScale(0.2)
        puzzle.zPosition = 2
        return puzzle
    }()
    
    let puzzle8: SKSpriteNode = {
        let puzzle = SKSpriteNode(imageNamed: "Puzzle(8)")
        puzzle.setScale(0.2)
        puzzle.zPosition = 2
        return puzzle
    }()
    
    let puzzle9: SKSpriteNode = {
        let puzzle = SKSpriteNode(imageNamed: "Puzzle(9)")
        puzzle.setScale(0.2)
        puzzle.zPosition = 2
        return puzzle
    }()
    
    let swapBtn: SKSpriteNode = {
        let btn = SKSpriteNode(imageNamed: "Swap Button")
        btn.zPosition = 3
        btn.setScale(0.4)
        return btn
    }()
    
    
    //MARK: - DidMove
    override func didMove(to view: SKView) {
        self.size.width = 414
        self.size.height = 896
        self.backgroundColor = .systemPink
        
        layout()
    }
    
    func layout() {
        
        //MARK: - Layout Backgroud
        background.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        self.addChild(background)
        
        //MARK: - Layout Puzzle
        puzzle1.position = CGPoint(x: self.frame.midX - 90, y: self.frame.midY + 110)
        self.addChild(puzzle1)
        
        puzzle2.position = CGPoint(x: self.frame.midX, y: self.frame.midY + 110)
        self.addChild(puzzle2)
        
        puzzle3.position = CGPoint(x: self.frame.midX + 90, y: self.frame.midY + 110)
        self.addChild(puzzle3)
        
        puzzle4.position = CGPoint(x: self.frame.midX - 90, y: self.frame.midY)
        self.addChild(puzzle4)
        
        puzzle5.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        self.addChild(puzzle5)
        
        puzzle6.position = CGPoint(x: self.frame.midX + 90, y: self.frame.midY)
        self.addChild(puzzle6)
        
        puzzle7.position = CGPoint(x: self.frame.midX - 90, y: self.frame.midY - 110)
        self.addChild(puzzle7)
        
        puzzle8.position = CGPoint(x: self.frame.midX, y: self.frame.midY - 110)
        self.addChild(puzzle8)
        
        puzzle9.position = CGPoint(x: self.frame.midX + 90, y: self.frame.midY - 110)
        self.addChild(puzzle9)
        
        //MARK: - Layout Button
        swapBtn.position = CGPoint(x: self.frame.midX, y: self.frame.minY + 200)
        self.addChild(swapBtn)
    }
    
    func checkPosition() {
        let pzl1Pos = CGPoint(x: self.frame.midX - 90, y: self.frame.midY + 110)
        let pzl2Pos = CGPoint(x: self.frame.midX, y: self.frame.midY + 110)
//        let pzl3Pos = CGPoint(x: self.frame.midX + 90, y: self.frame.midY + 110)
//        let pzl4Pos = CGPoint(x: self.frame.midX - 90, y: self.frame.midY)
//        let pzl5Pos = CGPoint(x: self.frame.midX, y: self.frame.midY)
//        let pzl6Pos = CGPoint(x: self.frame.midX + 90, y: self.frame.midY)
//        let pzl7Pos = CGPoint(x: self.frame.midX - 90, y: self.frame.midY - 110)
//        let pzl8Pos = CGPoint(x: self.frame.midX, y: self.frame.midY - 110)
//        let pzl9Pos = CGPoint(x: self.frame.midX + 90, y: self.frame.midY - 110)
        
        if puzzle1.position == pzl1Pos {
            currentPzl1 = 1
        } else if puzzle1.position == pzl2Pos {
            currentPzl1 = 2
        } else if puzzle2.position == pzl2Pos {
            currentPzl2 = 2
        } else if puzzle2.position == pzl1Pos {
            currentPzl2 = 1
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard touches.first != nil else { return }
        
        let scaleBig = SKAction.scale(to: 0.22, duration: 0.1)
        let scaleNormal = SKAction.scale(to: 0.2, duration: 0.1)
        
        let pzl1 = puzzle1.frame.contains((touches.first?.location(in: self))!)
        let pzl2 = puzzle2.frame.contains((touches.first?.location(in: self))!)
        let pzl3 = puzzle3.frame.contains((touches.first?.location(in: self))!)
        let pzl4 = puzzle4.frame.contains((touches.first?.location(in: self))!)
        let pzl5 = puzzle5.frame.contains((touches.first?.location(in: self))!)
        let pzl6 = puzzle6.frame.contains((touches.first?.location(in: self))!)
        let pzl7 = puzzle7.frame.contains((touches.first?.location(in: self))!)
        let pzl8 = puzzle8.frame.contains((touches.first?.location(in: self))!)
        let pzl9 = puzzle9.frame.contains((touches.first?.location(in: self))!)
        
        let pzl1Pos = CGPoint(x: self.frame.midX - 90, y: self.frame.midY + 110)
        let pzl2Pos = CGPoint(x: self.frame.midX, y: self.frame.midY + 110)
        let pzl3Pos = CGPoint(x: self.frame.midX + 90, y: self.frame.midY + 110)
        let pzl4Pos = CGPoint(x: self.frame.midX - 90, y: self.frame.midY)
        let pzl5Pos = CGPoint(x: self.frame.midX, y: self.frame.midY)
        let pzl6Pos = CGPoint(x: self.frame.midX + 90, y: self.frame.midY)
        let pzl7Pos = CGPoint(x: self.frame.midX - 90, y: self.frame.midY - 110)
        let pzl8Pos = CGPoint(x: self.frame.midX, y: self.frame.midY - 110)
        let pzl9Pos = CGPoint(x: self.frame.midX + 90, y: self.frame.midY - 110)
        
        if pzl1 {
            if pzl1Selected == false && selectedValue < 2 {
                pzl1Selected = true
                selectedValue += 1
                print("Current Selected Value \(selectedValue)")
                print("Puzzle Selected = \(pzl1Selected)")
                puzzle1.run(scaleBig)
            } else if pzl1Selected == true && selectedValue <= 2 {
                pzl1Selected = false
                selectedValue -= 1
                print("Current Selected Value \(selectedValue)")
                print("Puzzle Selected = \(pzl1Selected)")
                puzzle1.run(scaleNormal)
            }
        } else if pzl2 {
            if pzl2Selected == false && selectedValue < 2 {
                pzl2Selected = true
                selectedValue += 1
                print("Current Selected Value \(selectedValue)")
                print("Puzzle Selected = \(pzl2Selected)")
                puzzle2.run(scaleBig)
            } else if pzl2Selected == true && selectedValue <= 2 {
                pzl2Selected = false
                selectedValue -= 1
                print("Current Selected Value \(selectedValue)")
                print("Puzzle Selected = \(pzl2Selected)")
                puzzle2.run(scaleNormal)
            }
        } else if pzl3 {
            if pzl3Selected == false && selectedValue < 2 {
                pzl3Selected = true
                selectedValue += 1
                print(selectedValue)
                puzzle3.run(scaleBig)
            } else if pzl3Selected == true && selectedValue <= 2 {
                pzl3Selected = false
                selectedValue -= 1
                print(selectedValue)
                puzzle3.run(scaleNormal)
            }
        } else if pzl4 {
           if pzl4Selected == false && selectedValue < 2 {
                pzl4Selected = true
                selectedValue += 1
            print(selectedValue)
                puzzle4.run(scaleBig)
            } else if pzl4Selected == true && selectedValue <= 2 {
                pzl4Selected = false
                selectedValue -= 1
            print(selectedValue)
                puzzle4.run(scaleNormal)
            }
        } else if pzl5 {
            if pzl5Selected == false && selectedValue < 2 {
                pzl5Selected = true
                selectedValue += 1
                print(selectedValue)
                puzzle5.run(scaleBig)
            } else if pzl5Selected == true && selectedValue <= 2 {
                pzl5Selected = false
                selectedValue -= 1
                print(selectedValue)
                puzzle5.run(scaleNormal)
            }
        } else if pzl6 {
            if pzl6Selected == false && selectedValue < 2 {
                pzl6Selected = true
                selectedValue += 1
                print(selectedValue)
                puzzle6.run(scaleBig)
            } else if pzl6Selected == true && selectedValue <= 2 {
                pzl6Selected = false
                selectedValue -= 1
                print(selectedValue)
                puzzle6.run(scaleNormal)
            }
        } else if pzl7 {
            if pzl7Selected == false && selectedValue < 2 {
                pzl7Selected = true
                selectedValue += 1
                print(selectedValue)
                puzzle7.run(scaleBig)
            } else if pzl7Selected == true && selectedValue <= 2 {
                pzl7Selected = false
                selectedValue -= 1
                print(selectedValue)
                puzzle7.run(scaleNormal)
            }
        } else if pzl8 {
            if pzl8Selected == false && selectedValue < 2 {
                pzl8Selected = true
                selectedValue += 1
                print(selectedValue)
                puzzle8.run(scaleBig)
            } else if pzl8Selected == true && selectedValue <= 2 {
                pzl8Selected = false
                selectedValue -= 1
                print(selectedValue)
                puzzle8.run(scaleNormal)
            }
        } else if pzl9 {
            if pzl9Selected == false && selectedValue < 2 {
                pzl9Selected = true
                selectedValue += 1
                print(selectedValue)
                puzzle9.run(scaleBig)
            } else if pzl9Selected == true && selectedValue <= 2 {
                pzl9Selected = false
                selectedValue -= 1
                print(selectedValue)
                puzzle9.run(scaleNormal)
            }
            
            //MARK: - Swap Button
        } else if swapBtn.frame.contains((touches.first?.location(in: self))!) {
            print("Swap Button")
            //pzl 1 - 9
            if pzl1Selected && pzl2Selected {
//                checkPosition()
                print("current Pzl1 = \(currentPzl1)")
                print("current Pzl2 = \(currentPzl2)")
                print("Puzzle 1 position = \(puzzle1.position)")
                print("Puzzle 2 position = \(puzzle2.position)")
                selectedValue = 0
                puzzle1.run(SKAction.sequence([SKAction.move(to: pzl2Pos, duration: 0.5), scaleNormal]))
                pzl1Selected = false
//                currentPzl1 = 2
                
                print("Current Value Selected = \(pzl1Selected)")
                puzzle2.run(SKAction.sequence([SKAction.move(to: pzl1Pos, duration: 0.5), scaleNormal]))
//                currentPzl2 = 1
                pzl2Selected = false

                print("Current Value Selected = \(pzl2Selected)")
//                checkPosition()
                print("Puzzle 1 position = \(puzzle1.position)")
                print("Puzzle 2 position = \(puzzle2.position)")
                
            } else if pzl1Selected && pzl3Selected {
                puzzle1.run(SKAction.sequence([SKAction.move(to: pzl3Pos, duration: 0.5), scaleNormal]))
                currentPzl1 = 3
                puzzle3.run(SKAction.sequence([SKAction.move(to: pzl1Pos, duration: 0.5), scaleNormal]))
                currentPzl3 = 1
            } else if pzl1Selected && pzl4Selected {
                puzzle1.run(SKAction.sequence([SKAction.move(to: pzl4Pos, duration: 0.5), scaleNormal]))
                currentPzl1 = 4
                puzzle4.run(SKAction.sequence([SKAction.move(to: pzl1Pos, duration: 0.5), scaleNormal]))
                currentPzl4 = 1
            } else if pzl1Selected && pzl5Selected {
                puzzle1.run(SKAction.sequence([SKAction.move(to: pzl5Pos, duration: 0.5), scaleNormal]))
                currentPzl1 = 5
                puzzle5.run(SKAction.sequence([SKAction.move(to: pzl1Pos, duration: 0.5), scaleNormal]))
                currentPzl5 = 1
            } else if pzl1Selected && pzl6Selected {
                puzzle1.run(SKAction.sequence([SKAction.move(to: pzl6Pos, duration: 0.5), scaleNormal]))
                currentPzl1 = 6
                puzzle6.run(SKAction.sequence([SKAction.move(to: pzl1Pos, duration: 0.5), scaleNormal]))
                currentPzl6 = 1
            } else if pzl1Selected && pzl7Selected {
                puzzle1.run(SKAction.sequence([SKAction.move(to: pzl7Pos, duration: 0.5), scaleNormal]))
                currentPzl1 = 7
                puzzle7.run(SKAction.sequence([SKAction.move(to: pzl1Pos, duration: 0.5), scaleNormal]))
                currentPzl7 = 1
            } else if pzl1Selected && pzl8Selected {
                puzzle1.run(SKAction.sequence([SKAction.move(to: pzl8Pos, duration: 0.5), scaleNormal]))
                currentPzl1 = 8
                puzzle8.run(SKAction.sequence([SKAction.move(to: pzl1Pos, duration: 0.5), scaleNormal]))
                currentPzl8 = 1
            } else if pzl1Selected && pzl9Selected {
                puzzle1.run(SKAction.sequence([SKAction.move(to: pzl9Pos, duration: 0.5), scaleNormal]))
                currentPzl1 = 9
                puzzle9.run(SKAction.sequence([SKAction.move(to: pzl1Pos, duration: 0.5), scaleNormal]))
                currentPzl9 = 1
            //pzl 2 - 9
            } else if pzl2Selected {
                
            }
        }
        
    }
    
}
/*
 override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
 guard touches.first != nil else { return }
 
 if playBtn.frame.contains((touches.first?.location(in: self))!) {
 let story1 = Story1()
 story1.scaleMode = scaleMode
 let transition = SKTransition.fade(withDuration: 0.5)
 self.view?.presentScene(story1, transition: transition)
 }
 
 }
 */
