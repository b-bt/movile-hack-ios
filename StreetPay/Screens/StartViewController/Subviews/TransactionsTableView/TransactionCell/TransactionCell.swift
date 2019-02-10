//
//  TransactionCell.swift
//  StreetPay
//
//  Created by Bruno Barbosa on 09/02/19.
//  Copyright © 2019 Bruno Barbosa. All rights reserved.
//

import UIKit

class TransactionCell: UITableViewCell {

    @IBOutlet weak var vendorImg: UIImageView!
    @IBOutlet weak var vendorNameLbl: UILabel!
    @IBOutlet weak var transactionAmounLbl: UILabel!
    
    var darkBackground: Bool = false {
        didSet {
            if darkBackground {
                self.backgroundColor = UIColor(red:0.97, green:0.97, blue:0.97, alpha:1.00)
            } else {
                self.backgroundColor = UIColor.white
            }
        }
    }
    
    func config(withTransaction transaction: Transaction) {
        let vendor = transaction.vendor
        
        self.vendorImg.image = vendor.photo
        self.vendorNameLbl.text = vendor.name
        self.transactionAmounLbl.text = transaction.stringValue
    }

}
