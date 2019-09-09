//
//  SceneManager.swift
//  ClickerRPG
//
//  Created by Yoshiki Izumi on 2019/09/09.
//  Copyright © 2019 Yoshiki Izumi. All rights reserved.
//

import Foundation
import SpriteKit

class SceneManager: NSObject {
    
    //タイトルシーン
    class func titleScene(size: CGSize) -> TitleScene {
        let scene = TitleScene(size: size)
        return scene
    }

    //オープニングシーン
    class func openingScene(size: CGSize) -> OpeningScene {
        let scene = OpeningScene(size: size)
        return scene
    }

    //メニューシーン
    class func menuScene(size: CGSize) -> MenuScene {
        let scene = MenuScene(size: size)
        return scene
    }
    
    //バトルシーン
    class func battleScene(size: CGSize) -> BattleScene {
        let scene = BattleScene(size: size)
        return scene
    }

//    //結果シーン
//    class func resultScene(size: CGSize) -> ResultScene {
//        let scene = ResultScene(size: size)
//        return scene
//    }
    
    //シーン切り替え
    class func changeScene(view: SKView, New newScene: SKScene, Duration sec: TimeInterval) {
        let transition = SKTransition.fade(withDuration: sec)
        view.presentScene(newScene, transition: transition)
    }
}
