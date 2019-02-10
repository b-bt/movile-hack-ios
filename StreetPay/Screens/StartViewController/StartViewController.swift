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
    }
    
}

extension StartViewController: CameraViewDelegate {
    func detected(code: String) {
        self.performSegue(withIdentifier: "transactionSegue", sender: code)
    }
}
