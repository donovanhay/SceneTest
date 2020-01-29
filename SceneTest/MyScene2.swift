//
//  MyScene2.swift
//  SceneTest
//
//  Created by HanHaikun on 2019/12/8.
//  Copyright © 2019 HanHaikun. All rights reserved.
//

import Foundation
import SpriteKit

class MyScene2: SKScene {
    
    var button: SKSpriteNode!
    
    override func sceneDidLoad() {
        self.backgroundColor = .black
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        button = SKSpriteNode(color: .white, size: CGSize(width: 50, height: 30))
        button.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        button.position = CGPoint.zero
        self.addChild(button)
        print("MyScene2 sceneDidLoad")
    }
    
    override func didMove(to view: SKView) {
        
        button.removeFromParent()
        
        self.addChild(button)
        
        print("MyScene2 didMove to view")
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard  let touch = touches.first else {
            return
        }
        let touchLocation = touch.location(in: self)
        
        if button.contains(touchLocation) {
            
            self.view?.presentScene(global.Scene1)
            
        } else {
            self.backgroundColor = SKColor.gray
        }
        
    }
    
}
