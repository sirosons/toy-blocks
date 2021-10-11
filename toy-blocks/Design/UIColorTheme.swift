//
//  UIColorTheme.swift
//  toy-blocks
//
//  Created by James Rhodes on 7/13/20.
//  Copyright © 2020 James Rhodes. All rights reserved.
//

import UIKit

extension UIColor {
    public convenience init?(hexString: String) {
        let r, g, b, a: CGFloat

        if hexString.hasPrefix("#") {
            let start = hexString.index(hexString.startIndex, offsetBy: 1)
            let hexColor = String(hexString[start...])

            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255

                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }

        return nil
    }
}
struct UIColorTheme {
    static let Primary: UIColor = UIColor(hexString: "#263238FF")!
    static let PrimaryDark: UIColor = UIColor(hexString: "#263238FF")!

    static let NavBarBackgroundColor: UIColor = UIColor(hexString: "#F9F9F9")!
    static let NavBarForegroundColor: UIColor = UIColor(hexString: "#000000")!
    
    static let TextBoxBorderColor: UIColor = UIColor(hexString: "979797")!.withAlphaComponent(0.40)
    static let Placeholder: UIColor = UIColor(hexString: "#A4AAB3")!
    
    static let KeyboardToolbarColor: UIColor = UIColor(hexString: "#D1D5DB")!
    static let KeyboardToolbarBorderColor: UIColor = UIColor(hexString: "#C7C7CD")!
    static let Error: UIColor = UIColor.red
    static let Link: UIColor = UIColor(hexString: "#4A90E2")!
    
    static let TabBarItemNormal: UIColor = UIColor(hexString: "#929292")!
    static let TabBarItemSelected: UIColor = UIColor(hexString: "#B4834B")!

    static let TableViewBackground: UIColor = UIColor(hexString: "#EFEFF4")!

    static let PrimaryFontColor: UIColor = UIColor(hexString: "#263238FF")!
    static let SecondaryFontColor: UIColor = UIColor(hexString: "#26323854")!
    static let TertiaryFontColor: UIColor = UIColor(hexString: "#304FFEFF")!
    
    static let CellContentBackgroundColor: UIColor = UIColor.black.withAlphaComponent(0.12)
}
