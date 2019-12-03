//
//  ProgressDialog.swift
//  MujigaeTest
//
//  Created by Aslam Azis on 02/12/19.
//  Copyright © 2019 Aslam Azis. All rights reserved.
//

import UIKit

class ProgressDialog {
    
    var backView = UIVisualEffectView(effect: UIBlurEffect(style: .light))
    var indicator = UIActivityIndicatorView()
    var isShown = false
    
    public static let shared = ProgressDialog()
    
    private init(){}
    
    public func show(show: Bool, view: UIView) {
        if show && !isShown {
            self.isShown = true
            DispatchQueue.main.async {
                var view = view
                if let app = UIApplication.shared.delegate as? AppDelegate, let window = app.window {
                    view = window
                }
                self.backView.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
                self.backView.center = view.center
                self.backView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
                self.backView.clipsToBounds = true
                self.backView.layer.cornerRadius = 10
                
                self.indicator.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
                self.indicator.style = .whiteLarge
                self.indicator.center = CGPoint(x: self.backView.bounds.width / 2, y: self.backView.bounds.height / 2)
                
                self.backView.contentView.addSubview(self.indicator)
                view.addSubview(self.backView)
                self.indicator.startAnimating()
            }
        } else if !show && isShown {
            DispatchQueue.main.async {
                self.indicator.stopAnimating()
                self.backView.removeFromSuperview()
                self.isShown = false
            }
        }
    }
    
}
