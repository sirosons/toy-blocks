//
//  UIFontTheme.swift
//  toy-blocks
//
//  Created by James Rhodes on 7/13/20.
//  Copyright © 2020 James Rhodes. All rights reserved.//

import UIKit

enum FontSpacing: CGFloat {
    case tight = 0.8
    case roomy = 1.5
}
struct UIFontTheme {
    enum FontName: String {
        case Regular = "Roboto-Regular"
        case Bold    = "Roboto-Bold"
        case SemiBold = "Roboto-Medium"
        case Italic  = "Roboto-Italic"
        case Light   = "Roboto-Light"
        case Icon    = "FontAwesome"
    }
    enum FontSize: CGFloat {
        case xTiny = 10
        case tiny = 11
        case small = 12
        case `default` = 14
        case large = 16
        case xLarge = 24
        case huge = 32
    }
    static let defaultSize: FontSize = .default
    
    static func Regular(_ size: FontSize = defaultSize) -> UIFont {
        return UIFont(name: FontName.Regular.rawValue, size: size.rawValue)!
    }
    
    static func Bold(_ size: FontSize = defaultSize) -> UIFont {
        return UIFont(name: FontName.Bold.rawValue, size: size.rawValue)!
    }
    
    static func Italic(_ size: FontSize = defaultSize) -> UIFont {
        return UIFont(name: FontName.Italic.rawValue, size: size.rawValue)!
    }
    
    static func Light(_ size: FontSize = defaultSize) -> UIFont {
        return UIFont(name: FontName.Light.rawValue, size: size.rawValue)!
    }
    
    static func SemiBold(_ size: FontSize = defaultSize) -> UIFont {
        return UIFont(name: FontName.SemiBold.rawValue, size: size.rawValue)!
    }
    static func Icon(_ size: FontSize = defaultSize) -> UIFont {
        return UIFont(name: FontName.Icon.rawValue, size: size.rawValue)!
    }
    
    static func newFont(_ name: FontName, size: FontSize = defaultSize) -> UIFont {
        guard let font = UIFont(name: name.rawValue, size: size.cgFloatValue) else {
            fatalError("Unable to load font: \(name.rawValue)")
        }
        return font
    }
    static func applyLineHeight(lineHeight: CGFloat, toLabel label: UILabel) {
        guard let text = label.text else { return }

        let style = NSMutableParagraphStyle()
        style.lineHeightMultiple = lineHeight
        style.alignment = label.textAlignment
        let attributes = [NSAttributedString.Key.paragraphStyle: style]
        label.attributedText = NSAttributedString(string: text, attributes: attributes)
    }
}
extension UIFontTheme.FontSize {
    var cgFloatValue: CGFloat {
        return CGFloat(self.rawValue)
    }
}
