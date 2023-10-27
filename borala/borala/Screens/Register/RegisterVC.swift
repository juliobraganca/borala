//
//  RegisterVC.swift
//  borala
//
//  Created by Luana Mattana Damin on 20/09/23.
//

import UIKit
import FirebaseAuth

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
        
        let email:String = registerEmailTextField.text ?? ""
        let password:String = registerPasswordTextField.text ?? ""
        
        auth?.createUser(withEmail: email, password: password,completion: { (result, error) in
            if error != nil {
                print("Falha ao cadastar")
            }else{
                if self.registerEmailTextField.validateEmail() && self.registerEmailTextField.validateEmail() {
                    print("Sucesso ao Cadastrar")
                }else{
                    print("Emial ou senha invalidos")
                }}
        })
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
    
}


extension UITextField {
    
    func validateEmail() -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let validateRegex = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return validateRegex.evaluate (with: self.text)
    }
    func validadePassword() -> Bool {
        let passwordRegex = ".{6,}"
        let validateRegex = NSPredicate (format: "SELF MATCHES %0", passwordRegex)
        return validateRegex.evaluate(with: self.text)
        
    }
}
