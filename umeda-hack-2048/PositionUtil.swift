//
//  Position.swift
//  umeda-hack-2048
//
//  Created by Ryota Kameoka on 12/15/14.
//  Copyright (c) 2014 Ryota Kameoka. All rights reserved.
//

import Foundation
import UIKit

private let positionUtil = PositionUtil()

class PositionUtil {
    private let tilePositions: [[CGPoint]] = [
        [
            CGPoint(x: 44, y: 272), CGPoint(x: 120, y: 272), CGPoint(x: 196, y: 272), CGPoint(x: 272, y: 272)
        ],
        [
            CGPoint(x: 44, y: 196), CGPoint(x: 120, y: 196), CGPoint(x: 196, y: 196), CGPoint(x: 272, y: 196)
        ],
        [
            CGPoint(x: 44, y: 120), CGPoint(x: 120, y: 120), CGPoint(x: 196, y: 120), CGPoint(x: 272, y: 120)
        ],
        [
            CGPoint(x: 44, y: 44), CGPoint(x: 120, y: 44), CGPoint(x: 196, y: 44), CGPoint(x: 272, y: 44)
        ]
    ]

    class var sharedInstance: PositionUtil {
        return positionUtil
    }

    private init() {}

    func getTilePosition(_ x: Int, _ y: Int) -> CGPoint {
        return self.tilePositions[x][y]
    }
}