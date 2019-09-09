//
//  MenuScene.swift
//  ClickerRPG
//
//  Created by Yoshiki Izumi on 2019/09/09.
//  Copyright © 2019 Yoshiki Izumi. All rights reserved.
//

import SpriteKit

class MenuScene: SKScene {
    
    var changeSceneDelegate: ChangeSceneProtocol!
    
    
    private var player: SKSpriteNode?
    
    override func didMove(to view: SKView) {
        
        self.backgroundColor = UIColor.green
        
        print("MenuScene")
        
        let label = SKLabelNode()
        label.text = "Menu Scene"
        label.fontSize = 50
        label.fontColor = UIColor.black
        label.position = CGPoint(x: self.frame.width/2.0, y: self.size.height/10.0 * 9.0)
        
        self.player = SKSpriteNode(imageNamed: "player")
        self.player?.position.x = self.frame.width/2.0
        self.player?.position.y = self.frame.height/2.0
        self.player?.xScale = 0.5
        self.player?.yScale = 0.5

        self.addChild(self.player!)
        self.addChild(label)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        changeSceneDelegate.changeScene(scene: self.scene!)
    }
}
