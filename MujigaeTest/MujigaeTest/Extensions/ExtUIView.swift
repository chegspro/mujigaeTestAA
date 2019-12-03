//
//  ExtUIView.swift
//  MujigaeTest
//
//  Created by Aslam Azis on 03/12/19.
//  Copyright © 2019 Aslam Azis. All rights reserved.
//

import UIKit

extension UIView {
    
    public func anchorToSuperview(leading: CGFloat = 0,
                                  trailing: CGFloat = 0,
                                  top: CGFloat = 0,
                                  bottom: CGFloat = 0) {
        self.translatesAutoresizingMaskIntoConstraints = false
        if let parent = superview {
            NSLayoutConstraint.activate([
                leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: leading),
                trailingAnchor.constraint(equalTo: parent.trailingAnchor, constant: trailing),
                topAnchor.constraint(equalTo: parent.topAnchor, constant: top),
                bottomAnchor.constraint(equalTo: parent.bottomAnchor, constant: bottom)
                ])
        }
    }
    
    public func loadFromNib<T: UIView>(of class: T) {
        var bundle: Bundle?
        if bundle == nil {
            bundle = Bundle.init(for: T.self)
        }
        if bundle == nil {
            bundle = Bundle.main
        }
        let view = bundle?.loadNibNamed(String(describing: T.self), owner: self, options: nil)![0] as! UIView
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.subviews.forEach({$0.removeFromSuperview()})
        self.addSubview(view)
        view.anchorToSuperview()
    }
}
