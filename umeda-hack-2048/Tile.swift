//
//  Tile.swift
//  umeda-hack-2048
//
//  Created by Ryota Kameoka on 12/15/14.
//  Copyright (c) 2014 Ryota Kameoka. All rights reserved.
//

import Foundation
import SpriteKit

class Tile {
    var number: Int {
        didSet {
            self.numberNode.text = String(self.number)
            self.bgNode.color = ColorManager.sharedInstance.getColorByNumber(self.number)
            ScoreTracker.sharedInstance.score += self.number

            if self.number == 2048 {
                SceneManager.sharedInstance.gameScene.showGameClearedLabel()
            }
        }
    }
    var bgNode = SKSpriteNode()
    var numberNode = SKLabelNode()

    init(_ number: Int) {
        self.number = number
        self.bgNode.size = CGSize(width: 68, height: 68)
        self.bgNode.color = ColorManager.sharedInstance.getColorByNumber(self.number)
        self.numberNode.text = String(self.number)
        self.numberNode.fontColor = UIColor.blackColor()
        self.numberNode.fontName = "HiraKakuProN"
        self.bgNode.setScale(0)
        self.bgNode.addChild(self.numberNode)
        let scaleAnimation = SKAction.scaleTo(1, duration: 0.2)
        self.bgNode.runAction(scaleAnimation)
    }

    func setPosition(_ pos: CGPoint) {
        self.bgNode.position = pos
    }

    func destroy() {
        self.numberNode.removeFromParent()
        self.bgNode.removeFromParent()
    }
}