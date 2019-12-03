//
//  BaseButton.swift
//  MujigaeTest
//
//  Created by Aslam Azis on 03/12/19.
//  Copyright © 2019 Aslam Azis. All rights reserved.
//

import UIKit

@IBDesignable
class BaseButton: UIButton {
    
    @IBInspectable var backNormalColor: UIColor = UIColor(hex: 0xeba1a1) {
        didSet {
            setupBackground()
        }
    }
    
    @IBInspectable var textNormalColor: UIColor = .white {
        didSet {
            setTitleColor(textNormalColor, for: .normal)
        }
    }
    
    @IBInspectable var backSelectedColor: UIColor = .red {
        didSet {
            setupBackground()
        }
    }
    
    @IBInspectable var textSelectedColor: UIColor = .white {
        didSet {
            setTitleColor(textSelectedColor, for: .selected)
        }
    }
    
    @IBInspectable var backDisabledColor: UIColor = .lightGray {
        didSet {
            setupBackground()
        }
    }
    
    @IBInspectable var textDisabledColor: UIColor = .white {
        didSet {
            setTitleColor(textDisabledColor, for: .disabled)
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return self.layer.borderWidth
        }
        set {
            self.layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return self.layer.cornerRadius
        }
        
        set {
            self.layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable var normalBorderColor: UIColor = UIColor(hex: 0xaaaaaa) {
        didSet {
            setupBackground()
        }
    }
    
    @IBInspectable var selectedBorderColor: UIColor = UIColor(hex: 0xeba1a1) {
        didSet {
            setupBackground()
        }
    }
    
    override open var isSelected: Bool {
        didSet {
            setupBackground()
        }
    }
    
    override open var isEnabled: Bool {
        didSet {
            setupBackground()
        }
    }
    
    private func setupBackground() {
        self.tintColor = .clear
        switch (isEnabled, isSelected) {
        case (true, true):
            self.layer.borderColor = selectedBorderColor.cgColor
            self.backgroundColor = backSelectedColor
        case (true, false):
            self.layer.borderColor = normalBorderColor.cgColor
            self.backgroundColor = backNormalColor
        default:
            self.layer.borderColor = backDisabledColor.cgColor
            self.backgroundColor = backDisabledColor
        }
    }
    
}
