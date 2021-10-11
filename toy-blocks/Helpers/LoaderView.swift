//
//  LoaderView.swift
//  toy-blocks
//
//  Created by Siroson on 2021-10-10.
//  Copyright © 2021 James Rhodes. All rights reserved.
//

import UIKit

class LoaderView: UIView {
    
    static let tag = 12121212
    private var activity: UIActivityIndicatorView!
    
    class func show() {
        DispatchQueue.main.async {
            guard let window = UIApplication.shared.windows.filter({ $0.isKeyWindow }).first else { return }
            let loader = LoaderView(frame: window.bounds)
            loader.backgroundColor = UIColor.black.withAlphaComponent(0.2)
            loader.tag = LoaderView.tag
            loader.setupViews()
            window.addSubview(loader)
        }
    }
    
    class func hide() {
        DispatchQueue.main.async {
            guard let window = UIApplication.shared.windows.filter({ $0.isKeyWindow }).first,
                  let loader = window.viewWithTag(LoaderView.tag) else { return }
            loader.removeFromSuperview()
        }
    }
    
    private func setupViews() {
        if activity == nil {
            activity = UIActivityIndicatorView(style: .medium)
            addSubview(activity)
            activity.center = self.center
        }
        
        activity.startAnimating()
    }
}
