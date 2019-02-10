//
//  TransactionCard.swift
//  StreetPay
//
//  Created by Bruno Barbosa on 09/02/19.
//  Copyright © 2019 Bruno Barbosa. All rights reserved.
//

import UIKit

@IBDesignable class TransactionCard: UIView {

    @IBOutlet weak var valueFld: ValueTextField!
    fileprivate var contentView: UIView!
    fileprivate var shadowView: UIView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    private func commonInit() {
        self.backgroundColor = UIColor.clear
        self.createShadow()
        
        self.clipsToBounds = false
        self.contentView = self.loadViewFromNib()
        self.shadowView.addSubview(self.contentView)
        
        let heightConstraint = NSLayoutConstraint(item: self.contentView, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 1, constant: 0)
        let widthConstraint = NSLayoutConstraint(item: self.contentView, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 1, constant: 0)
        let centerXConstraint = NSLayoutConstraint(item: self.contentView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0)
        let centerYConstraint = NSLayoutConstraint(item: self.contentView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0)
        self.addConstraints([heightConstraint, widthConstraint, centerXConstraint, centerYConstraint])
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.layer.cornerRadius = 6.0
        self.contentView.layer.masksToBounds = true
        
        self.setNeedsLayout()
//        self.bringSubviewToFront(self.contentView)
    }
    
    private func createShadow() {
        self.shadowView = UIView()
        self.shadowView.backgroundColor = UIColor.clear
        self.shadowView.addDropShadow()
        self.addSubview(self.shadowView)
        
        let heightConstraint = NSLayoutConstraint(item: self.shadowView, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 1, constant: 0)
        let widthConstraint = NSLayoutConstraint(item: self.shadowView, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 1, constant: 0)
        let centerXConstraint = NSLayoutConstraint(item: self.shadowView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0)
        let centerYConstraint = NSLayoutConstraint(item: self.shadowView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0)
        self.addConstraints([heightConstraint, widthConstraint, centerXConstraint, centerYConstraint])
        self.shadowView.translatesAutoresizingMaskIntoConstraints = false
    }

}
