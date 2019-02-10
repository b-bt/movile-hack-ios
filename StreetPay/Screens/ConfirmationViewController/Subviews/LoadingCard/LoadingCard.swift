//
//  LoadingCard.swift
//  StreetPay
//
//  Created by Bruno Barbosa on 10/02/19.
//  Copyright © 2019 Bruno Barbosa. All rights reserved.
//

import UIKit

class LoadingCard: UIView {

    fileprivate var contentView: UIView!
    fileprivate var shadowView: UIView!
    
    @IBOutlet weak var loadingBgImg: UIImageView!
    @IBOutlet var loadingConstraint: NSLayoutConstraint!
    @IBOutlet var allInfoConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var amountLbl: UILabel!
    
    var isLoading: Bool = true {
        didSet {
            UIView.animate(withDuration: 0.2) {
                // TODO: animate
                self.loadingConstraint.isActive = self.isLoading
                self.allInfoConstraint.isActive = !self.isLoading
                
                self.amountLbl.isHidden = self.isLoading
                
                let imageName = self.isLoading ? "loading-circle-icon" : "success-circle-icon"
                self.loadingBgImg.image = UIImage(named: imageName)!
                
                if self.isLoading {
                    self.activityIndicator.startAnimating()
                } else {
                    self.activityIndicator.stopAnimating()
                }
            }
        }
    }
    
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
