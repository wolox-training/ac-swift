//
//  UIFontExtension.swift
//  WBooks
//
//  Created by Ariel Cid on 3/16/18.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Foundation
import UIKit

extension UIFont {
    
    static func systemBold(size: CGFloat = 17) -> UIFont {
        return UIFont.boldSystemFont(ofSize: size)
    }

    static func systemHeavy(size: CGFloat = 17) -> UIFont {
        return UIFont.systemFont(ofSize: size, weight: UIFont.Weight.heavy)
    }
}
