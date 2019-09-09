//
//  GameView.swift
//  ClickerRPG
//
//  Created by Yoshiki Izumi on 2019/09/09.
//  Copyright © 2019 Yoshiki Izumi. All rights reserved.
//

import Foundation
import SpriteKit

class GameView: SKView, ChangeSceneProtocol{
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpGameView()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //初期画面を設定
    func setUpGameView() {
        switchingTitleScene()
    }
    
    //タイトルシーンへ切り替え
    func switchingTitleScene() {
        let scene = SceneManager.titleScene(size: self.bounds.size)
        scene.changeSceneDelegate = self
        SceneManager.changeScene(view: self, New: scene, Duration: 0.5)
    }

    //オープニングシーンへ切り替え
    func switchingOpeningScene() {
        let scene = SceneManager.openingScene(size: self.bounds.size)
        scene.changeSceneDelegate = self
        SceneManager.changeScene(view: self, New: scene, Duration: 0.5)
    }

    //メニューシーンへ切り替え
    func switchingMenuScene() {
        let scene = SceneManager.menuScene(size: self.bounds.size)
        scene.changeSceneDelegate = self
        SceneManager.changeScene(view: self, New: scene, Duration: 0.5)
    }
    
    //バトルシーンへ切り替え
    func switchingBattleScene() {
        let scene = SceneManager.battleScene(size: self.bounds.size)
        scene.changeSceneDelegate = self
        SceneManager.changeScene(view: self, New: scene, Duration: 0.5)
    }
    
    //デリゲートメソッド
    func changeScene(scene: SKScene) {
        
        if scene.isKind(of: TitleScene.self) {
            switchingOpeningScene()
        } else if scene.isKind(of: OpeningScene.self) {
            switchingMenuScene()
        } else if scene.isKind(of: MenuScene.self) {
            switchingBattleScene()
        } else if scene.isKind(of: BattleScene.self) {
            switchingMenuScene()
        }
    }
}
