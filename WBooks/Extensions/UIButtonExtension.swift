//
//  UIButtonExtension.swift
//  WBooks
//
//  Created by Ariel Cid on 3/27/18.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {

    func setGradient() {
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = [
            UIColor.deepSkyBlue().cgColor,
            UIColor.mediumTurquoise().cgColor
        ]
        gradient.locations = [0, 1]
        gradient.startPoint = CGPoint(x: 0.06, y: 0.5)
        gradient.endPoint = CGPoint(x: 1, y: 0.5)
        gradient.cornerRadius = frame.height / 2
        layer.addSublayer(gradient)
        gradient.zPosition = -1
    }

}
