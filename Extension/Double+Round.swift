//
//  Double+Round.swift
//  VideoRotation
//
//  Created by Martin Prusa on 08.08.2020.
//

import Foundation
import CoreGraphics

extension Double {
    var cgFloatRounded: CGFloat {
        return CGFloat((1000 * self).rounded() / 100)
    }
}
