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

private let a = 44
private let b = 121
private let c = 198
private let d = 276

class PositionUtil {
    private let tilePositions: [[CGPoint]] = [
        [
            CGPoint(x: a, y: d), CGPoint(x: b, y: d), CGPoint(x: c, y: d), CGPoint(x: d, y: d)
        ],
        [
            CGPoint(x: a, y: c), CGPoint(x: b, y: c), CGPoint(x: c, y: c), CGPoint(x: d, y: c)
        ],
        [
            CGPoint(x: a, y: b), CGPoint(x: b, y: b), CGPoint(x: c, y: b), CGPoint(x: d, y: b)
        ],
        [
            CGPoint(x: a, y: a), CGPoint(x: b, y: a), CGPoint(x: c, y: a), CGPoint(x: d, y: a)
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