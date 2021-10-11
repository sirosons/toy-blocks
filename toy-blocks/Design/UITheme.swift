//
//  UITheme.swift
//  toy-blocks
//
//  Created by James Rhodes on 7/13/20.
//  Copyright © 2020 James Rhodes. All rights reserved.
//

import UIKit

struct UITheme {
    static func configureTheme() {
        UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().backgroundColor = UIColorTheme.Primary
        UITabBar.appearance().tintColor = UIColorTheme.TabBarItemNormal
        
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColorTheme.TabBarItemNormal], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColorTheme.TabBarItemSelected], for: .selected)
        
        UIApplication.shared.statusBarStyle = .lightContent
        UINavigationBar.appearance().barTintColor = UIColorTheme.NavBarBackgroundColor
        UINavigationBar.appearance().tintColor = UIColorTheme.NavBarForegroundColor
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.font: UIFontTheme.Bold(), NSAttributedString.Key.foregroundColor: UIColorTheme.NavBarForegroundColor]
        
        let barAttributes = [NSAttributedString.Key.font: UIFontTheme.Regular(), NSAttributedString.Key.foregroundColor: UIColorTheme.NavBarForegroundColor]
        UIBarButtonItem.appearance(whenContainedInInstancesOf: [UINavigationBar.self]).tintColor = UIColorTheme.NavBarForegroundColor
        UIBarButtonItem.appearance(whenContainedInInstancesOf: [UINavigationBar.self]).setTitleTextAttributes(barAttributes, for: UIControl.State())
        }
}
