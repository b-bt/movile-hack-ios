//
//  ConfirmationViewController.swift
//  StreetPay
//
//  Created by Bruno Barbosa on 10/02/19.
//  Copyright © 2019 Bruno Barbosa. All rights reserved.
//

import UIKit

class ConfirmationViewController: UIViewController {
    
    var isLoading: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupNavbar()
    }
    
    func setupNavbar() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        
        let imageName = self.isLoading ? "logo-color" : "logo-white"
        let logoImg = UIImageView(image: UIImage(named: imageName))
        logoImg.contentMode = .scaleAspectFit
        self.navigationItem.titleView = logoImg
    }

}
