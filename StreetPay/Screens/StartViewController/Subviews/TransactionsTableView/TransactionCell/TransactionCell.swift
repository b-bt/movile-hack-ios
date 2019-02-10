//
//  TransactionCell.swift
//  StreetPay
//
//  Created by Bruno Barbosa on 09/02/19.
//  Copyright © 2019 Bruno Barbosa. All rights reserved.
//

import UIKit

class TransactionCell: UITableViewCell {

    var darkBackground: Bool = false {
        didSet {
            if darkBackground {
                self.backgroundColor = UIColor(red:0.97, green:0.97, blue:0.97, alpha:1.00)
            } else {
                self.backgroundColor = UIColor.white
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
