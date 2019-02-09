//
//  Transaction.swift
//  StreetPay
//
//  Created by Bruno Barbosa on 09/02/19.
//  Copyright © 2019 Bruno Barbosa. All rights reserved.
//

import Foundation

class Transaction {
    var vendor: Vendor
    var value: Double?
    
    init(withVendor vendor: Vendor) {
        self.vendor = vendor
    }
}
