//
//  TitleScene.swift
//  ClickerRPG
//
//  Created by Yoshiki Izumi on 2019/09/09.
//  Copyright © 2019 Yoshiki Izumi. All rights reserved.
//

import Foundation
import SpriteKit

class TitleScene: SKScene {
    
    var changeSceneDelegate: ChangeSceneProtocol!
    
    override func didMove(to view: SKView) {
        
        self.backgroundColor = UIColor.orange
        
        print("TitleScene")
        
        let label = SKLabelNode()
        label.text = "Title Scene"
        label.fontSize = 50
        label.fontColor = UIColor.black
        label.position = CGPoint(x: self.frame.width/2.0, y: self.size.height/2.0)
        self.addChild(label)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        changeSceneDelegate.changeScene(scene: self.scene!)
    }
}
