//
//  ValueTextField.swift
//  StreetPay
//
//  Created by Bruno Barbosa on 10/02/19.
//  Copyright © 2019 Bruno Barbosa. All rights reserved.
//

import UIKit

class ValueTextField: UIView {

    fileprivate var contentView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    private func commonInit() {
        self.contentView = self.loadViewFromNib()
        self.addSubview(self.contentView)
    }

}
