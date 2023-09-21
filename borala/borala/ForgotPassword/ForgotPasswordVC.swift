//
//  ForgotPasswordVC.swift
//  borala
//
//  Created by Julio Braganca on 21/09/23.
//

import UIKit

class ForgotPasswordVC: UIViewController {
    
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var confirmButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureVC()
        configureImageView()
        configureTextField()
        configureButton()
    }
    
    
    func configureVC() {
        view.setBackground()
    }
    
    
    func configureImageView() {
        logoImageView.image = Images.logo
    }
    
    
    func configureTextField() {
        emailTextField.setupTextField(placeholder: "Insira seu email", delegate: self)
    }
    
    
    func configureButton() {
        confirmButton.setupButton(title: "Confirmar", isEnabled: false)
    }
    
    
    @IBAction func tappedConfirmButton(_ sender: UIButton) {
    }
}


extension ForgotPasswordVC: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.isEditingTextField()
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.isTextFieldEmpty()
        enableButton()
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    func enableButton() {
        if emailTextField.hasText {
            confirmButton.isEnabled = true
        } else {
            confirmButton.isEnabled = false
        }
    }
    
}
