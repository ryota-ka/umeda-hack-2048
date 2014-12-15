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

            if self.score == 0 {
                self.updateRankingLabel()
            }
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
            var ranking = self.ranking
            ranking.append(self.score)
            sort(&ranking) { $0 > $1 }
            ud.setObject([Int](ranking[0...4]), forKey: "ranking")
        }
    }

    var ranking: [Int] {
        get {
            let ud = NSUserDefaults.standardUserDefaults()
            if let ranking = ud.objectForKey("ranking") as? [Int] {
                return ranking
            } else {
                var emptyRanking: [Int] = []
                return emptyRanking
            }
        }
    }

    private var label: SKLabelNode
    private var rankingLabel: SKLabelNode

    class var sharedInstance: ScoreTracker {
        return scoreTracker
    }

    private init() {
        self.label = SKLabelNode(text: "Score: 0")
        self.label.fontColor = UIColor.whiteColor()
        self.label.position = CGPoint(x:160, y: 340)
        self.label.fontName = "HiraKakuProN"
        self.label.fontSize = 20
        SceneManager.sharedInstance.gameScene.addChild(self.label)

        self.rankingLabel = SKLabelNode(text: "")
        self.rankingLabel.color = UIColor.whiteColor()
        self.rankingLabel.fontName = "HiraKakuProN"
        self.rankingLabel.fontSize = 18
        self.rankingLabel.position = CGPoint(x: 160, y: 400)
        SceneManager.sharedInstance.gameScene.addChild(self.rankingLabel)
    }

    private func updateLabel() {
        self.label.text = "Score: \(self.score)"
    }

    private func updateRankingLabel() {
        var text = ""
        var i = 0
        for score in self.ranking {
            i++
            text += "#\(i): \(score)  "
        }
        self.rankingLabel.text = text
    }

    func resetScore() {
        self.highestScore = self.score
        self.score = 0
    }
}