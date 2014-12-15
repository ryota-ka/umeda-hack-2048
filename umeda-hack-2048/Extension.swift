//
//  Extension.swift
//  umeda-hack-2048
//
//  Created by Ryota Kameoka on 12/15/14.
//  Copyright (c) 2014 Ryota Kameoka. All rights reserved.
//

import Foundation

extension Array {
    func sample() -> T {
        let index = Int(arc4random_uniform(UInt32(self.count)))
        return self[index]
    }
}