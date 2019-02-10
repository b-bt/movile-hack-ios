//
//  PinkButton.swift
//  StreetPay
//
//  Created by Bruno Barbosa on 09/02/19.
//  Copyright © 2019 Bruno Barbosa. All rights reserved.
//

import UIKit

@IBDesignable class RectangleButton: UIView {

    @IBInspectable var title: String? {
        didSet {
            if let title = title {
                self.contentView.setTitle(title, for: .normal)
            }
        }
    }
    @IBInspectable var disabledTitle: String? {
        didSet {
            if let disabledTitle = disabledTitle {
                self.contentView.setTitle(disabledTitle, for: .disabled)
            }
        }
    }
    @IBInspectable var isEnabled: Bool = true {
        didSet {
            self.contentView.isEnabled = self.isEnabled
            if isEnabled {
                self.contentView.backgroundColor = UIColor(red:1.00, green:0.25, blue:0.46, alpha:1.00)
                self.contentView.tintColor = UIColor.white
                self.contentView.layer.borderWidth = 0
            } else {
                self.contentView.backgroundColor = UIColor.white
                self.contentView.tintColor = UIColor(red:0.90, green:0.90, blue:0.90, alpha:1.00)
                self.contentView.layer.borderColor = UIColor(red:0.90, green:0.90, blue:0.90, alpha:1.00).cgColor
                self.contentView.layer.borderWidth = 1.0
            }
        }
    }
    @IBInspectable var alternateTintColor: UIColor? {
        didSet {
            if let tintColor = alternateTintColor {
                self.contentView.setTitleColor(tintColor, for: .normal)
            }
        }
    }
    @IBInspectable var alternateBackgroundColor: UIColor? {
        didSet {
            if let bgColor = alternateBackgroundColor {
                self.contentView.backgroundColor = bgColor
            }
        }
    }
    
    var delegate: RectangleButtonDelegate?
    
    fileprivate var contentView: UIButton!
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
        self.contentView = self.loadViewFromNib() as! UIButton
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
        
        self.contentView.addTarget(self, action: #selector(buttonTouched), for: .touchUpInside)
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

    @objc func buttonTouched() {
        self.delegate?.buttonTouched()
    }
}
