//
//  ConfirmationViewController.swift
//  StreetPay
//
//  Created by Bruno Barbosa on 10/02/19.
//  Copyright © 2019 Bruno Barbosa. All rights reserved.
//

import UIKit

class ConfirmationViewController: UIViewController {
    
    @IBOutlet weak var loadingCard: LoadingCard!
    var isLoading: Bool = true {
        didSet {
            self.loadingCard.isLoading = self.isLoading
            DispatchQueue.main.async {
                UIView.animate(withDuration: 0.2, animations: {
                    if self.isLoading {
                        self.view.backgroundColor = UIColor.white
                    } else {
                        self.view.backgroundColor = UIColor(red:0.28, green:0.89, blue:0.76, alpha:1.00)
                    }
                })
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupNavbar()
        self.isLoading = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.isLoading = false
        }
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
