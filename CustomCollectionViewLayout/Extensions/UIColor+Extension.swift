//
//  UIColor+Extension.swift
//  CustomCollectionViewLayout
//
//  Created by Nazmul Islam on 3/4/21.
//

import UIKit

extension UIColor {
    static var random: UIColor {
        return UIColor(
            hue: .random(in: 0...1),
            saturation: 1.0,
            brightness: 1.0,
            alpha: 1.0
        )
    }
}
