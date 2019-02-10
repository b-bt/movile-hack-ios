//
//  TransactionViewController.swift
//  StreetPay
//
//  Created by Bruno Barbosa on 09/02/19.
//  Copyright © 2019 Bruno Barbosa. All rights reserved.
//

import UIKit

class TransactionViewController: UIViewController {

    @IBOutlet weak var transactionCard: TransactionCard!
    @IBOutlet weak var continueButton: PinkButton!
    
    var transactionAmount: Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.transactionCard.valueFld.delegate = self
        self.setupNavbar()
    }
    
    func setupNavbar() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        
        let logoImg = UIImageView(image: UIImage(named: "logo-color"))
        logoImg.contentMode = .scaleAspectFit
        self.navigationItem.titleView = logoImg
    }

}

extension TransactionViewController: ValueTextFieldDelegate {
    func filled(value: Double) {
        self.continueButton.isEnabled = true
        print(value)
    }
    
    func cleared() {
        self.continueButton.isEnabled = false
    }
    
    
}
