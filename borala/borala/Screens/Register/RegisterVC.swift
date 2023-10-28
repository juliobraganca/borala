//
//  RegisterVC.swift
//  borala
//
//  Created by Luana Mattana Damin on 20/09/23.
//

import UIKit
import FirebaseAuth
import Firebase

class RegisterVC: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var newAccountLabel: UILabel!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var registerEmailTextField: UITextField!
    
    @IBOutlet weak var registerPasswordTextField: UITextField!
    
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    
    @IBOutlet weak var registerButton: UIButton!
    
    var auth: Auth?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.auth = Auth.auth()
        configElements()
    }
    
    @IBAction func tappedRegisterButton(_ sender: UIButton) {
        
        let email: String = registerEmailTextField.text ?? ""
        let password: String = registerPasswordTextField.text ?? ""
        let repeatPassword: String = repeatPasswordTextField.text ?? ""
        
        if password != repeatPassword {
            self.showAlert(title: "Ops! Parece que as senhas não correspondem. Revise e tente outra vez.")

        }else {
            
            auth?.createUser(withEmail: email, password: password,completion: { (result, error) in
                       if self.registerEmailTextField.validateEmail() && self.registerPasswordTextField.validadePassword() {
                           self.showAlert(title: "Parabéns, seu cadastro foi concluído com sucesso.")
                             
                       }else{
                           self.showAlert(title: "Ops, algo deu errado durante o cadastro. Verifique se o email e a senha estão de acordo com os requisitos.")
                       }
            })
        }
    }
  
    
    func configElements() {
        
        newAccountLabel.text = "Nova Conta"
        
        nameTextField.placeholder = "Digite seu nome"
        nameTextField.delegate = self
        
        registerEmailTextField.placeholder = "Digite seu email"
        registerEmailTextField.keyboardType = .emailAddress
        registerEmailTextField.delegate = self
        
        registerPasswordTextField.placeholder = "Digite uma senha"
        registerPasswordTextField.delegate = self
        
        repeatPasswordTextField.placeholder = "Repita a senha"
        repeatPasswordTextField.delegate = self
        
        registerButton.setTitle("Cadastrar", for: .normal)
        
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.orange.cgColor
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderWidth = 0
        textField.layer.borderColor = UIColor.gray.cgColor
    }
    
    func showAlert(title:String) {
        let alertcontroller: UIAlertController = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        let okButton: UIAlertAction = UIAlertAction(title: "OK", style: .default)
        alertcontroller.addAction(okButton)
        self.present(alertcontroller,animated: true, completion: nil)
        }
}

extension UITextField {
    
    func validateEmail() -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let validateRegex = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return validateRegex.evaluate (with: self.text)
    }
    func validadePassword() -> Bool {
        let passwordRegex = ".{6,}"
        let validateRegex = NSPredicate (format: "SELF MATCHES %@", passwordRegex)
        return validateRegex.evaluate(with: self.text)
        
    }
}
