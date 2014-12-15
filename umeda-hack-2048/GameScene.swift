//
//  GameScene.swift
//  umeda-hack-2048
//
//  Created by Ryota Kameoka on 12/15/14.
//  Copyright (c) 2014 Ryota Kameoka. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    let board = SKSpriteNode(imageNamed: "board")

    override func didMoveToView(view: SKView) {
        self.initBoard()
        self.createSwipeRecognizers()
        TileManager.sharedInstance.addTileOf2ToRandomEmptyPosition()
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }

    func createSwipeRecognizers() {
        var swipeDown = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
        swipeDown.direction = UISwipeGestureRecognizerDirection.Down
        self.view?.addGestureRecognizer(swipeDown)

        var swipeRight = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
        swipeRight.direction = UISwipeGestureRecognizerDirection.Right
        self.view?.addGestureRecognizer(swipeRight)

        var swipeUp = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
        swipeUp.direction = UISwipeGestureRecognizerDirection.Up
        self.view?.addGestureRecognizer(swipeUp)

        var swipeLeft = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
        swipeLeft.direction = UISwipeGestureRecognizerDirection.Left
        self.view?.addGestureRecognizer(swipeLeft)
    }

    func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.Down:
                TileManager.sharedInstance.swipeDown()
            case UISwipeGestureRecognizerDirection.Right:
                TileManager.sharedInstance.swipeRight()
            case UISwipeGestureRecognizerDirection.Up:
                TileManager.sharedInstance.swipeUp()
            case UISwipeGestureRecognizerDirection.Left:
                TileManager.sharedInstance.swipeLeft()
            default:
                break
            }
        }
    }

    func initBoard() {
        self.board.size = CGSize(width: 320, height: 320)
        self.board.anchorPoint = CGPoint(x: 0, y: 0)
        self.board.zPosition = -1
        self.addChild(self.board)
    }

    func showGameClearedLabel() {
        let label = SKLabelNode(text: "Game Cleared")
        label.color = UIColor.whiteColor()
        label.fontName = "HiraKakuProN"
        label.position = CGPoint(x: 160, y: 350)
        SceneManager.sharedInstance.gameScene.addChild(label)
    }

    func showGamesOverScreen() {
        let screen = SKSpriteNode(color: UIColor(red: 0, green: 0, blue: 0, alpha: 1), size: CGSize(width: 320, height: 568))
        screen.anchorPoint = CGPoint(x: 0, y: 0)
        screen.alpha = 0
        let label = SKLabelNode(text: "Game's Over")
        label.color = UIColor.whiteColor()
        label.fontName = "HiraKakuProN"
        label.position = CGPoint(x: 160, y: 284)
        screen.addChild(label)
        self.addChild(screen)

        let animation = SKAction.fadeAlphaTo(1, duration: 3)
        screen.runAction(animation)
    }
}
