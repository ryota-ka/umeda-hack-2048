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

    var highestScore: Int {
        get {
            let ud = NSUserDefaults.standardUserDefaults()
            var val = ud.objectForKey("highestScore")
            if val == nil {
                ud.setObject(0, forKey: "highestScore")
                val = 0
            }
            return val as Int
        }
        set {
            let ud = NSUserDefaults.standardUserDefaults()
            ud.setObject(self.score, forKey: "highestScore")
        }
    }

    private var label: SKLabelNode
    private var highestScoreLabel: SKLabelNode

    class var sharedInstance: ScoreTracker {
        return scoreTracker
    }

    private init() {
        self.label = SKLabelNode(text: "Score: 0")
        self.label.fontColor = UIColor.whiteColor()
        self.label.position = CGPoint(x:160, y: 400)
        self.label.fontName = "HiraKakuProN"
        SceneManager.sharedInstance.gameScene.addChild(self.label)

        self.highestScoreLabel = SKLabelNode(text: "Highest Score: 0")
        self.highestScoreLabel.fontColor = UIColor.whiteColor()
        self.highestScoreLabel.position = CGPoint(x:160, y: 450)
        self.highestScoreLabel.fontName = "HiraKakuProN"
        SceneManager.sharedInstance.gameScene.addChild(self.highestScoreLabel)
    }

    private func updateLabel() {
        self.label.text = "Score: \(self.score)"
        self.highestScoreLabel.text = "Highest Score: \(self.highestScore)"
    }

    func resetScore() {
        self.highestScore = self.score
        self.score = 0
    }
}