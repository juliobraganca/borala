//
//  ViewController.swift
//  borala
//
//  Created by Julio Braganca on 23/08/23.
//

import UIKit

class LoginVC: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var registerGreyButton: UIButton!
    
    @IBOutlet weak var forgotPasswordGreyButton: UIButton!
    
    @IBOutlet weak var enterButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configElements()
    }
    
    @IBAction func tappedEnterButton(_ sender: UIButton) {
        let testRegisterScreen = UIStoryboard(name: "RegisterVC", bundle: nil).instantiateViewController(withIdentifier: "RegisterVC") as? RegisterVC
        navigationController?.pushViewController(testRegisterScreen ?? UIViewController(), animated: true)

    }
    
    @IBAction func tappedRegisterButton(_ sender: UIButton) {
        let registerScreen = UIStoryboard(name: "RegisterVC", bundle: nil).instantiateViewController(withIdentifier: "RegisterVC") as? RegisterVC
        navigationController?.pushViewController(registerScreen ?? UIViewController(), animated: true)

    }
    
    
    
    func configElements() {
        emailTextField.placeholder = "Digite seu e-mail"
        emailTextField.keyboardType = .emailAddress
        emailTextField.delegate = self
        
        passwordTextField.placeholder = "Digite sua senha"
        passwordTextField.delegate = self
        
        registerGreyButton.setTitle("Cadastre-se", for: .normal)
        registerGreyButton.layer.borderColor = UIColor.blue.cgColor
        registerGreyButton.layer.borderWidth = 1.0
        registerGreyButton.layer.borderColor = UIColor.systemBlue.cgColor
        registerGreyButton.layer.cornerRadius = 10.0
        registerGreyButton.clipsToBounds = true
        registerGreyButton.backgroundColor = UIColor.lightGray
        
        
        forgotPasswordGreyButton.setTitle("Esqueci a senha", for: .normal)
        forgotPasswordGreyButton.layer.borderColor = UIColor.blue.cgColor
        forgotPasswordGreyButton.layer.borderWidth = 1.0
        forgotPasswordGreyButton.layer.borderColor = UIColor.systemBlue.cgColor
        forgotPasswordGreyButton.layer.cornerRadius = 10.0
        forgotPasswordGreyButton.clipsToBounds = true
        forgotPasswordGreyButton.backgroundColor = UIColor.lightGray

        enterButton.setTitle("Entrar", for: .normal)
        enterButton.tintColor = .orange
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.orange.cgColor
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderWidth = 0
          textField.layer.borderColor = UIColor.gray.cgColor
      }


}

