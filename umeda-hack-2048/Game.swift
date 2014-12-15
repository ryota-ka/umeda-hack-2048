//
//  Game.swift
//  umeda-hack-2048
//
//  Created by Ryota Kameoka on 12/15/14.
//  Copyright (c) 2014 Ryota Kameoka. All rights reserved.
//

import Foundation

private let game = Game()

class Game {
    class var sharedInstance: Game {
        return game
    }

    private init() {}
}