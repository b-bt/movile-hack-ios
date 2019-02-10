//
//  ValueTextField.swift
//  StreetPay
//
//  Created by Bruno Barbosa on 10/02/19.
//  Copyright © 2019 Bruno Barbosa. All rights reserved.
//

import UIKit
import InputMask

class ValueTextField: UIView {

    fileprivate var contentView: UIView!
    
    @IBOutlet var listener: MaskedTextFieldDelegate!
    @IBOutlet weak var field: UITextField!
    
    var delegate: ValueTextFieldDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    private func commonInit() {
        self.contentView = self.loadViewFromNib()
        self.addSubview(self.contentView)
    }

}

extension ValueTextField: MaskedTextFieldDelegateListener {
    open func textField(_ textField: UITextField, didFillMandatoryCharacters complete: Bool, didExtractValue value: String) {
        guard complete else {
            self.delegate?.cleared()
            return
        }
        guard var inputValue: String = textField.text else {
            return
        }
        inputValue = inputValue.replacingOccurrences(of: ",", with: ".")
        
        guard let doubleValue = Double(inputValue) else {
            return
        }
        self.delegate?.filled(value: doubleValue)
        print(value)
    }
}
