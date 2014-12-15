//
//  SceneManager.swift
//  umeda-hack-2048
//
//  Created by Ryota Kameoka on 12/15/14.
//  Copyright (c) 2014 Ryota Kameoka. All rights reserved.
//

import Foundation
import UIKit

private let sceneManager = SceneManager()

class SceneManager {
    class var sharedInstance: SceneManager {
        return sceneManager
    }

    var gameScene = GameScene(size: CGSizeMake(320, 568))

    private init() {}
}