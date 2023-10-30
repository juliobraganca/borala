//
//  UIButton+Ext.swift
//  borala
//
//  Created by Julio Braganca on 21/09/23.
//

import UIKit

extension UIButton {
    
    func setupButton(title: String, isEnabled: Bool) {
        self.setTitle(title, for: .normal)
        self.isEnabled = isEnabled

    }
}
