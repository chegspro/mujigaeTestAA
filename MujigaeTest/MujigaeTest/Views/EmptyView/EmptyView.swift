//
//  EmptyView.swift
//  MujigaeTest
//
//  Created by Aslam Azis on 03/12/19.
//  Copyright © 2019 Aslam Azis. All rights reserved.
//

import UIKit

class EmptyView: UIView {
    
    @IBOutlet weak var lbMessage: UILabel!
    
    var delegate: EmptyViewDelegate?
    
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    private func setupView() {
        loadFromNib(of: self)
    }
    
    func setMessage(_ text: String) {
        lbMessage.text = text
    }
    
    @IBAction func btRetryTapped() {
        delegate?.didTapRetry()
    }
    
}

protocol EmptyViewDelegate {
    func didTapRetry()
}
