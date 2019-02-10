//
//  ValueTextFieldDelegate.swift
//  StreetPay
//
//  Created by Bruno Barbosa on 10/02/19.
//  Copyright © 2019 Bruno Barbosa. All rights reserved.
//

import Foundation

protocol ValueTextFieldDelegate {
    func filled(value: Double)
    func cleared()
}
