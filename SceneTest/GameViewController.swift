//
//  GameViewController.swift
//  SceneTest
//
//  Created by HanHaikun on 2019/12/8.
//  Copyright © 2019 HanHaikun. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("ModelName: ", UIDevice.current.modelName)
        
        print("isNotchScreen: ", UIDevice.current.isNotchScreen)
        
        print("viewDidLoad: ", self.view.safeAreaInsets)
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            print("Scene1 present")
            view.presentScene(global.Scene1)
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
        }
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewSafeAreaInsetsDidChange() {
        print("viewSafeAreaInsetsDidChange: ", self.view.safeAreaInsets)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("viewWillAppear: ", self.view.safeAreaInsets)
    }
    
    override func viewDidLayoutSubviews() {
        print("viewDidLayoutSubviews: ", self.view.safeAreaInsets)
    }
    
    
}
