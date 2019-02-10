//
//  StartView.swift
//  StreetPay
//
//  Created by Bruno Barbosa on 09/02/19.
//  Copyright © 2019 Bruno Barbosa. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {

    @IBOutlet weak var cameraView: CameraView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        cameraView.delegate = self
        self.setupNavbar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.cameraView.startCapture()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.cameraView.stopCapture()
    }
    
    func setupNavbar() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        
        let logoImg = UIImageView(image: UIImage(named: "logo-white"))
        logoImg.contentMode = .scaleAspectFit
        self.navigationItem.titleView = logoImg
    }
    
}

extension StartViewController: CameraViewDelegate {
    func detected(code: String) {
        DispatchQueue.main.async {
            self.performSegue(withIdentifier: "transactionSegue", sender: code)
        }
    }
}
