//
//  Vendor.swift
//  StreetPay
//
//  Created by Bruno Barbosa on 09/02/19.
//  Copyright © 2019 Bruno Barbosa. All rights reserved.
//

import UIKit

class Vendor {
    var name: String
    var photo: UIImage
    
    init(withName name: String, andPhoto photoName: String) {
        self.name = name
        self.photo = UIImage(named: photoName)!
    }
}
