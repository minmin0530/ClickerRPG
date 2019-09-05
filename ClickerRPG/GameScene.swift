//
//  GameScene.swift
//  ClickerRPG
//
//  Created by Yoshiki Izumi on 2019/09/05.
//  Copyright © 2019 Yoshiki Izumi. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    private let rollArray : [String] = ["敵","弱","中","強","必","超","激","殺","裏"]
    
    private var labelRoll1 : SKLabelNode?
    private var labelRoll2 : SKLabelNode?
    private var labelRoll3 : SKLabelNode?
    private var labelResult1 : SKLabelNode?
    private var labelResult2 : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    
    override func didMove(to view: SKView) {
        
        // Get label node from scene and store it for use later
//        self.label = self.childNode(withName: "//helloLabel") as? SKLabelNode
//        if let label = self.label {
//            label.alpha = 0.0
//            label.run(SKAction.fadeIn(withDuration: 2.0))
//        }
        self.labelResult1 = SKLabelNode(text: "0")
        self.labelResult1?.position.x = 0
        self.labelResult1?.position.y = 0
        self.labelResult1?.xScale = 2
        self.labelResult1?.yScale = 2
        self.labelResult2 = SKLabelNode(text: "0")
        self.labelResult2?.position.x = 0
        self.labelResult2?.position.y = 100
        self.labelResult2?.xScale = 2
        self.labelResult2?.yScale = 2

        self.labelRoll1 = SKLabelNode(text: "弱")
        self.labelRoll1?.position.x = -120
        self.labelRoll1?.position.y = -300
        self.labelRoll1?.xScale = 4
        self.labelRoll1?.yScale = 4
        self.labelRoll2 = SKLabelNode(text: "弱")
        self.labelRoll2?.position.x = 0
        self.labelRoll2?.position.y = -300
        self.labelRoll2?.xScale = 4
        self.labelRoll2?.yScale = 4
        self.labelRoll3 = SKLabelNode(text: "弱")
        self.labelRoll3?.position.x = 120
        self.labelRoll3?.position.y = -300
        self.labelRoll3?.xScale = 4
        self.labelRoll3?.yScale = 4

        addChild(self.labelRoll1!)
        addChild(self.labelRoll2!)
        addChild(self.labelRoll3!)
        addChild(self.labelResult1!)
        addChild(self.labelResult2!)
//        self.labelRoll?.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        
        // Create shape node to use during mouse interaction
        let w = (self.size.width + self.size.height) * 0.05
        self.spinnyNode = SKShapeNode.init(rectOf: CGSize.init(width: w, height: w), cornerRadius: w * 0.3)
        
        if let spinnyNode = self.spinnyNode {
            spinnyNode.lineWidth = 2.5
            
            spinnyNode.run(SKAction.repeatForever(SKAction.rotate(byAngle: CGFloat(Double.pi), duration: 1)))
            spinnyNode.run(SKAction.sequence([SKAction.wait(forDuration: 0.5),
                                              SKAction.fadeOut(withDuration: 0.5),
                                              SKAction.removeFromParent()]))
        }
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.green
            self.addChild(n)
        }
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.blue
            self.addChild(n)
        }
    }
    
    func touchUp(atPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.red
            self.addChild(n)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let random1 = Int.random(in: 0...8)
        let random2 = Int.random(in: 0...8)
        let random3 = Int.random(in: 0...8)
        self.labelRoll1?.text = rollArray[random1]
        self.labelRoll2?.text = rollArray[random2]
        self.labelRoll3?.text = rollArray[random3]
        
        if random1 != 0 &&
            self.labelRoll1?.text == self.labelRoll2?.text &&
            self.labelRoll2?.text == self.labelRoll3?.text {
            self.labelResult1?.text = "味方：3カード！"
        } else {
            if (random1 != 0 && self.labelRoll1?.text == self.labelRoll2?.text) ||
               (random2 != 0 && self.labelRoll2?.text == self.labelRoll3?.text) ||
               (random3 != 0 && self.labelRoll1?.text == self.labelRoll3?.text) {
               self.labelResult1?.text = "味方：ペア！"
            } else {
               self.labelResult1?.text = "味方：" + String(random1 + random2 + random3)
            }
        }
        

        if random1 == 0 &&
            self.labelRoll1?.text == self.labelRoll2?.text &&
            self.labelRoll2?.text == self.labelRoll3?.text {
            self.labelResult2?.text = "敵：3カード！"
        } else {
            if  ((random1 == random2) && random1 == 0) ||
                ((random2 == random3) && random2 == 0) ||
                ((random1 == random3) && random3 == 0) {
                self.labelResult2?.text = "敵：ペア！"
            } else {
                if (random1 == 0 || random2 == 0 || random3 == 0) {
                    self.labelResult2?.text = String("敵：！")
                } else {
                    self.labelResult2?.text = String("敵：0")
                }
            }
        }

        
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
