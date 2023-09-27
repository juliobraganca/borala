//
//  Constants.swift
//  borala
//
//  Created by Julio Braganca on 21/09/23.
//

import UIKit

enum Images {
    static let background   = UIImage(named: "background")
    static let logo         = UIImage(named: "logoBorala")
}


enum Color {
    static let butterscotch = colorRGB(red: 245, green: 207, blue: 60, alpha: 1)
    static let avocado      = colorRGB(red: 148, green: 220, blue: 146, alpha: 1)
    static let caribbean    = colorRGB(red: 138, green: 223, blue: 220, alpha: 1)
    static let tangerine    = colorRGB(red: 248, green: 153, blue: 99, alpha: 1)
    static let neutral      = colorRGB(red: 246, green: 239, blue: 221, alpha: 1)
}


func colorRGB(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> UIColor {
    return UIColor(red: red / 255, green: green / 255, blue: blue / 255, alpha: alpha)
}
