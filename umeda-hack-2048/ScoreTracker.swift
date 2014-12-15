//
//  ScoreTracker.swift
//  umeda-hack-2048
//
//  Created by Ryota Kameoka on 12/15/14.
//  Copyright (c) 2014 Ryota Kameoka. All rights reserved.
//

import Foundation
import SpriteKit

private let scoreTracker = ScoreTracker()

class ScoreTracker {
    var score: Int = 0 {
        didSet {
            self.updateLabel()
        }
    }
    private var label = SKLabelNode(text: "SCORE: 0")

    class var sharedInstance: ScoreTracker {
        return scoreTracker
    }

    private init() {
        self.label.fontColor = UIColor.whiteColor()
        self.label.position = CGPoint(x:160, y: 400)
        SceneManager.sharedInstance.gameScene.addChild(self.label)
    }

    private func updateLabel() {
        self.label.text = "SCORE: \(self.score)"
    }
}