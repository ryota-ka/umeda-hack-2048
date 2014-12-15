//
//  ColorManager.swift
//  umeda-hack-2048
//
//  Created by Ryota Kameoka on 12/15/14.
//  Copyright (c) 2014 Ryota Kameoka. All rights reserved.
//

import Foundation
import UIKit

private var colorManager = ColorManager()

class ColorManager {
    class var sharedInstance: ColorManager {
        return colorManager
    }

    private init() {}

    let color2 = UIColor(red: 0.92, green: 0.89, blue: 0.85, alpha: 1)
    let color4 = UIColor(red: 0.91, green: 0.89, blue: 0.79, alpha: 1)
    let color8 = UIColor(red: 0.88, green: 0.69, blue: 0.48, alpha: 1)
    let color16 = UIColor(red: 0.83, green: 0.55, blue: 0.34, alpha: 1)
    let color32 = UIColor(red: 0.84, green: 0.48, blue: 0.38, alpha: 1)
    let color64 = UIColor(red: 0.80, green: 0.35, blue: 0.23, alpha: 1)
    let color128 = UIColor(red: 0.92, green: 0.84, blue: 0.44, alpha: 1)
    let color256 = UIColor(red: 0.89, green: 0.80, blue: 0.42, alpha: 1)
    let color512 = UIColor(red: 0.84, green: 0.74, blue: 0.29, alpha: 1)
    let color1024 = UIColor(red: 0.86, green: 0.75, blue: 0.25, alpha: 1)
    let color2048 = UIColor(red: 0.88, green: 0.76, blue: 0.25, alpha: 1)
    let color4096 = UIColor(red: 0.58, green: 0.85, blue: 0.58, alpha: 1)

    func getColorByNumber(_ number: Int) -> UIColor {
        switch (number) {
        case 2:
            return color2
        case 4:
            return color4
        case 8:
            return color8
        case 16:
            return color16
        case 32:
            return color32
        case 64:
            return color64
        case 128:
            return color128
        case 256:
            return color256
        case 512:
            return color512
        case 1024:
            return color1024
        case 2048:
            return color2048
        default:
            return color4096
        }
    }
}