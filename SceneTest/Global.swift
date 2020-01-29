//
//  Global.swift
//  SceneTest
//
//  Created by HanHaikun on 2019/12/8.
//  Copyright © 2019 HanHaikun. All rights reserved.
//

import Foundation
import SpriteKit


class Global {
    private init() {
        
    }
    static let shareInstance = Global()
    
    var Scene1 = MyScene1(size: CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
    var Scene2 = MyScene2(size: CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
}

let global: Global = Global.shareInstance
