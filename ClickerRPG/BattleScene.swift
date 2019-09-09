//
//  BattleScene.swift
//  ClickerRPG
//
//  Created by Yoshiki Izumi on 2019/09/09.
//  Copyright © 2019 Yoshiki Izumi. All rights reserved.
//

import Foundation
import SpriteKit

class BattleScene: SKScene {
    
    var changeSceneDelegate: ChangeSceneProtocol!
    
    private let rollArray : [String] = ["敵","火","水","風","光","闇","時","土","空"]
    
    private var labelRoll1 : SKLabelNode?
    private var labelRoll2 : SKLabelNode?
    private var labelRoll3 : SKLabelNode?

    private var labelRoll4 : SKLabelNode?
    private var labelRoll5 : SKLabelNode?
    private var labelRoll6 : SKLabelNode?

    private var labelRoll7 : SKLabelNode?
    private var labelRoll8 : SKLabelNode?
    private var labelRoll9 : SKLabelNode?

//    private var labelResult1 : SKLabelNode?
//    private var labelResult2 : SKLabelNode?
    private var imageEnemy : SKSpriteNode?
    private var buttonMenu : SKSpriteNode?
    private var hpEnemy: SKSpriteNode?
    private var hpPlayer: SKSpriteNode?

    override func didMove(to view: SKView) {
        
        self.backgroundColor = UIColor.blue

//        self.labelResult1 = SKLabelNode(text: "0")
//        self.labelResult1?.position.x = self.frame.width/2.0
//        self.labelResult1?.position.y = self.frame.height/2.0 - 100
//        self.labelResult1?.xScale = 2
//        self.labelResult1?.yScale = 2
//        self.labelResult2 = SKLabelNode(text: "0")
//        self.labelResult2?.position.x = self.frame.width/2.0
//        self.labelResult2?.position.y = self.frame.height/2.0
//        self.labelResult2?.xScale = 2
//        self.labelResult2?.yScale = 2
        
        self.labelRoll1 = SKLabelNode(text: "火")
        self.labelRoll1?.position.x = self.frame.width/2.0 - 120
        self.labelRoll1?.position.y = self.frame.height/2.0 - 130
        self.labelRoll1?.xScale = 3
        self.labelRoll1?.yScale = 3
        self.labelRoll2 = SKLabelNode(text: "水")
        self.labelRoll2?.position.x = self.frame.width/2.0
        self.labelRoll2?.position.y = self.frame.height/2.0 - 130
        self.labelRoll2?.xScale = 3
        self.labelRoll2?.yScale = 3
        self.labelRoll3 = SKLabelNode(text: "風")
        self.labelRoll3?.position.x = self.frame.width/2.0 + 120
        self.labelRoll3?.position.y = self.frame.height/2.0 - 130
        self.labelRoll3?.xScale = 3
        self.labelRoll3?.yScale = 3

        self.labelRoll4 = SKLabelNode(text: "光")
        self.labelRoll4?.position.x = self.frame.width/2.0 - 120
        self.labelRoll4?.position.y = self.frame.height/2.0 - 250
        self.labelRoll4?.xScale = 3
        self.labelRoll4?.yScale = 3
        self.labelRoll5 = SKLabelNode(text: "闇")
        self.labelRoll5?.position.x = self.frame.width/2.0
        self.labelRoll5?.position.y = self.frame.height/2.0 - 250
        self.labelRoll5?.xScale = 3
        self.labelRoll5?.yScale = 3
        self.labelRoll6 = SKLabelNode(text: "時")
        self.labelRoll6?.position.x = self.frame.width/2.0 + 120
        self.labelRoll6?.position.y = self.frame.height/2.0 - 250
        self.labelRoll6?.xScale = 3
        self.labelRoll6?.yScale = 3

        self.labelRoll7 = SKLabelNode(text: "土")
        self.labelRoll7?.position.x = self.frame.width/2.0 - 120
        self.labelRoll7?.position.y = self.frame.height/2.0 - 370
        self.labelRoll7?.xScale = 3
        self.labelRoll7?.yScale = 3
        self.labelRoll8 = SKLabelNode(text: "空")
        self.labelRoll8?.position.x = self.frame.width/2.0
        self.labelRoll8?.position.y = self.frame.height/2.0 - 370
        self.labelRoll8?.xScale = 3
        self.labelRoll8?.yScale = 3
        self.labelRoll9 = SKLabelNode(text: "敵")
        self.labelRoll9?.position.x = self.frame.width/2.0 + 120
        self.labelRoll9?.position.y = self.frame.height/2.0 - 370
        self.labelRoll9?.xScale = 3
        self.labelRoll9?.yScale = 3

        
        
        
        self.imageEnemy = SKSpriteNode(imageNamed: "enemy1")
        self.imageEnemy?.position.x =  self.frame.width/2.0
        self.imageEnemy?.position.y =  self.frame.height/2.0 + 100
        self.imageEnemy?.xScale = 0.2
        self.imageEnemy?.yScale = 0.2
        
        self.buttonMenu = SKSpriteNode(imageNamed: "menu")
        self.buttonMenu?.position.x =  self.frame.width/4.0
        self.buttonMenu?.position.y =  self.frame.height/10.0 * 9.0
        self.buttonMenu?.xScale = 0.5
        self.buttonMenu?.yScale = 0.5
        self.buttonMenu?.name = "buttonMenu"

        self.hpEnemy = SKSpriteNode( color: UIColor.red, size: CGSize.init(width: self.frame.width/2.0, height: 10.0) )
        self.hpEnemy?.position.x = self.frame.width / 2.0
        self.hpEnemy?.position.y = self.frame.height / 10.0 * 8.0

        self.hpPlayer = SKSpriteNode( color: UIColor.red, size: CGSize.init(width: self.frame.width/2.0, height: 10.0) )
        self.hpPlayer?.position.x = self.frame.width / 2.0
        self.hpPlayer?.position.y = self.frame.height / 10.0 * 0.5

        addChild(self.hpPlayer!)
        addChild(self.hpEnemy!)
        addChild(self.buttonMenu!)
        addChild(self.imageEnemy!)
        addChild(self.labelRoll1!)
        addChild(self.labelRoll2!)
        addChild(self.labelRoll3!)
        addChild(self.labelRoll4!)
        addChild(self.labelRoll5!)
        addChild(self.labelRoll6!)
        addChild(self.labelRoll7!)
        addChild(self.labelRoll8!)
        addChild(self.labelRoll9!)
//        addChild(self.labelResult1!)
//        addChild(self.labelResult2!)
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first as UITouch? {
            let location = touch.location(in: self)
            if self.atPoint(location).name == "buttonMenu" {
                changeSceneDelegate.changeScene(scene: self.scene!)
                return
            }
        }
    
 
        if self.hpPlayer!.size.width >= CGFloat(10.0) {
            self.hpPlayer?.size.width -= 10.0
            self.hpPlayer?.position.x -= 5
        } else {
            changeSceneDelegate.changeScene(scene: self.scene!)
        }
        
        if self.hpEnemy!.size.width >= CGFloat(20.0) {
            self.hpEnemy?.size.width -= 20.0
            self.hpEnemy?.position.x -= 10.0
        } else {
            changeSceneDelegate.changeScene(scene: self.scene!)
        }
        
        let random1 = Int.random(in: 0...8)
        let random2 = Int.random(in: 0...8)
        let random3 = Int.random(in: 0...8)
        let random4 = Int.random(in: 0...8)
        let random5 = Int.random(in: 0...8)
        let random6 = Int.random(in: 0...8)
        let random7 = Int.random(in: 0...8)
        let random8 = Int.random(in: 0...8)
        let random9 = Int.random(in: 0...8)
        self.labelRoll1?.text = rollArray[random1]
        self.labelRoll2?.text = rollArray[random2]
        self.labelRoll3?.text = rollArray[random3]
        self.labelRoll4?.text = rollArray[random4]
        self.labelRoll5?.text = rollArray[random5]
        self.labelRoll6?.text = rollArray[random6]
        self.labelRoll7?.text = rollArray[random7]
        self.labelRoll8?.text = rollArray[random8]
        self.labelRoll9?.text = rollArray[random9]

        
/*
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
    */
        
    }
}
