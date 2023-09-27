//
//  UITextField+Ext.swift
//  borala
//
//  Created by Julio Braganca on 21/09/23.
//

import UIKit

extension UITextField {
    
    func isEditingTextField() {
        self.layer.borderColor = UIColor.cyan.cgColor
        self.layer.borderWidth = 1.5
    }
    
    
    func setupTextField(placeholder: String, delegate: UITextFieldDelegate) {
        self.placeholder = placeholder
        self.delegate = delegate
        self.layer.borderColor = UIColor.red.cgColor
        self.layer.borderWidth = 1.5
    }
    
    
    func isTextFieldEmpty() {
        if self.hasText {
            self.layer.borderColor = Color.tangerine.cgColor
        } else {
            self.layer.borderColor = UIColor.red.cgColor
        }
    }
}
