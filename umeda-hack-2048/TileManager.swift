//
//  TileManager.swift
//  umeda-hack-2048
//
//  Created by Ryota Kameoka on 12/15/14.
//  Copyright (c) 2014 Ryota Kameoka. All rights reserved.
//

import Foundation
import SpriteKit

private let tileManager = TileManager()

class TileManager {
    var tiles: [[Tile?]]

    class var sharedInstance: TileManager {
        return tileManager
    }

    private init() {
        self.tiles = [
            [nil, nil, nil, nil],
            [nil, nil, nil, nil],
            [nil, nil, nil, nil],
            [nil, nil, nil, nil]
        ]
    }

    func addTileOf2ToRandomEmptyPosition() {
        var tile = Tile(2)

        var positionCandidates: [(Int, Int)] = []
        for i in 0..<4 {
            for j in 0..<4 {
                if self.tiles[i][j] == nil {
                    positionCandidates.append((i, j))
                }
            }
        }
        var (x, y) = positionCandidates.sample()

        self.tiles[x][y] = tile

        tile.bgNode.position = PositionUtil.sharedInstance.getTilePosition(x, y)
        SceneManager.sharedInstance.gameScene.addChild(tile.bgNode)
    }

    func swipeUp() {
        var movedFlg = false
        for i in 1...3 {
            for j in 0...3 {
                if self.tiles[i][j] == nil {
                    continue
                }

                var k = i
                while (k > 0 && (self.tiles[k-1][j] == nil || self.tiles[i][j]?.number == self.tiles[k-1][j]?.number)) {
                    k--
                }
                if (i != k) {
                    if (self.tiles[k][j] != nil) {
                        self.tiles[i][j]?.number *= 2
                        self.tiles[k][j]?.destroy()
                        self.tiles[k][j] = nil
                    }

                    self.tiles[k][j] = self.tiles[i][j]

                    var animation = SKAction.moveTo(PositionUtil.sharedInstance.getTilePosition(k, j), duration: 0.1)
                    self.tiles[k][j]?.bgNode.runAction(animation)

                    self.tiles[i][j] = nil

                    movedFlg = true
                }
            }
        }
        if movedFlg {
            self.addTileOf2ToRandomEmptyPosition()
        }
        checkAfterMovement()
    }

    func swipeDown() {
        var movedFlg = false
        for i in [2, 1, 0] {
            for j in 0...3 {
                if self.tiles[i][j] == nil {
                    continue
                }

                var k = i
                while (k < 3 && (self.tiles[k+1][j] == nil || self.tiles[i][j]?.number == self.tiles[k+1][j]?.number)) {
                    k++
                }

                if (i != k) {
                    if (self.tiles[k][j] != nil) {
                        self.tiles[i][j]?.number *= 2
                        self.tiles[k][j]?.destroy()
                        self.tiles[k][j] = nil
                    }

                    self.tiles[k][j] = self.tiles[i][j]

                    var animation = SKAction.moveTo(PositionUtil.sharedInstance.getTilePosition(k, j), duration: 0.1)
                    self.tiles[k][j]?.bgNode.runAction(animation)

                    self.tiles[i][j] = nil

                    movedFlg = true
                }
            }
        }
        if movedFlg {
            self.addTileOf2ToRandomEmptyPosition()
        }
        checkAfterMovement()
    }

    func swipeLeft() {
        var movedFlg = false
        for i in 0...3 {
            for j in 1...3 {
                if self.tiles[i][j] == nil {
                    continue
                }
                var k = j
                while (k > 0 && (self.tiles[i][k-1] == nil || self.tiles[i][j]?.number == self.tiles[i][k-1]?.number)) {
                    k--
                }

                if (j != k) {
                    if (self.tiles[i][k] != nil) {
                        self.tiles[i][j]?.number *= 2
                        self.tiles[i][k]?.destroy()
                        self.tiles[i][k] = nil
                    }

                    self.tiles[i][k] = self.tiles[i][j]

                    var animation = SKAction.moveTo(PositionUtil.sharedInstance.getTilePosition(i, k), duration: 0.1)
                    self.tiles[i][k]?.bgNode.runAction(animation)

                    self.tiles[i][j] = nil

                    movedFlg = true
                }
            }
        }
        if movedFlg {
            self.addTileOf2ToRandomEmptyPosition()
        }
        checkAfterMovement()
    }

    func swipeRight() {
        var movedFlg = false
        for i in 0...3 {
            for j in [2, 1, 0] {
                if self.tiles[i][j] == nil {
                    continue
                }

                var k = j
                while (k < 3 && (self.tiles[i][k+1] == nil || self.tiles[i][j]?.number == self.tiles[i][k+1]?.number)) {
                    k++
                }

                if (j != k) {
                    if (self.tiles[i][k] != nil) {
                        self.tiles[i][j]?.number *= 2
                        self.tiles[i][k]?.destroy()
                        self.tiles[i][k] = nil
                    }

                    self.tiles[i][k] = self.tiles[i][j]

                    var animation = SKAction.moveTo(PositionUtil.sharedInstance.getTilePosition(i, k), duration: 0.1)
                    self.tiles[i][k]?.bgNode.runAction(animation)

                    self.tiles[i][j] = nil

                    movedFlg = true
                }
            }
        }
        if movedFlg {
            self.addTileOf2ToRandomEmptyPosition()
        }
        checkAfterMovement()
    }

    func checkAfterMovement() {
        var boardFilledFlg = false
        let filledRowCount = self.tiles.filter({
            $0.filter({
                return $0 == nil
            }).count == 0
        }).count
        if filledRowCount == 4 { // タイルがいっぱいになった場合
            var sameFlg = false
            for_i: for i in 0...3 {
                for j in 0...3 {
                    if (i+1 <= 3 && j+1 <= 3) {
                        var me = self.tiles[i][j]
                        var bottom = self.tiles[i+1][j]
                        var right = self.tiles[i][j+1]
                        if (me?.number == bottom?.number || me?.number == right?.number) {
                            sameFlg = true
                            break for_i
                        }
                    }
                }
            }
            if sameFlg == false {
                SceneManager.sharedInstance.gameScene.showGamesOverScreen()
            }
        }
    }
}