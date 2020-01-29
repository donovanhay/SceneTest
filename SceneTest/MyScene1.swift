//
//  MyScene1.swift
//  SceneTest
//
//  Created by HanHaikun on 2019/12/8.
//  Copyright © 2019 HanHaikun. All rights reserved.
//

import Foundation
import SpriteKit

class MyScene1: SKScene {
    
    var button: SKSpriteNode! {
        didSet {
            print("Scene1 button didSet")
        }
    }
    
//    override init() {
//        super.init()
//        print("init")
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    override init(size: CGSize) {
        super.init(size: size)
        button = SKSpriteNode(color: .black, size: CGSize(width: 50, height: 30))
        print("init with size")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMove(to view: SKView) {
        self.backgroundColor = SKColor.white
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        button = SKSpriteNode(color: .black, size: CGSize(width: 50, height: 30))
        button.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        button.position = CGPoint.zero
        self.addChild(button)
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard  let touch = touches.first else {
            return
        }
        let touchLocation = touch.location(in: self)
        
        if button.contains(touchLocation) {
            
            
            self.view?.presentScene(global.Scene2, transition: SKTransition.doorsCloseHorizontal(withDuration: 1.0))
            
        }
        
    }
    
    
}
