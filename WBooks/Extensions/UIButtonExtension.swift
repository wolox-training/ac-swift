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
        gradient.frame = frame
        gradient.colors = [
            UIColor(red: 0, green: 0.68, blue: 0.93, alpha: 1).cgColor,
            UIColor(red: 0.22, green: 0.8, blue: 0.8, alpha: 1).cgColor
        ]   // TO DO: UICOLORS
        gradient.locations = [0, 1]
        gradient.startPoint = CGPoint(x: 0.06, y: 0.5)
        gradient.endPoint = CGPoint(x: 1, y: 0.5)
        gradient.cornerRadius = 25
        layer.addSublayer(gradient)
    }
}
