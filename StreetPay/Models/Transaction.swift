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
    var value: Double
    var stringValue: String {
        return "R$" + String(format: "%.02f", value)
    }
    
    init(withVendor vendor: Vendor, andValue value: Double) {
        self.vendor = vendor
        self.value = value
    }
}
