//
//  RegisterVC.swift
//  borala
//
//  Created by Luana Mattana Damin on 20/09/23.
//

import UIKit
import FirebaseAuth
import Firebase



class RegisterVC: UIViewController {
    
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
        checkTextFields()
    }
    
    @IBAction func tappedRegisterButton(_ sender: UIButton) {
        let email: String = self.registerEmailTextField.text ?? ""
        let password: String = self.registerPasswordTextField.text ?? ""
        auth?.createUser(withEmail:email, password: password, completion: { (Result, error) in
            if error != nil {
                self.showAlert(title: "Atenção", message: "Erro ao cadastrar. Verifique seus dados")
            } else{
                self.ShowAlertReturnLogin(title:"Parabéns", message: "Registro realizado com sucesso!")
                
            }
        })
        
    }
    func checkTextFields() {
        nameTextField.addTarget(self, action: #selector(textFieldDidEndOnExit), for: .editingDidEndOnExit)
    }
    @objc func textFieldDidEndOnExit() {
        if nameTextField.validateName() {
            enableRegisterEmailTextField ()
        }
        else {
            disableRegisterEmailTextfield()
            self.showAlert(title: "Atenção", message: "Inserir um nome com no mínimo 2 caractéries")
        }
    }
    func enableRegisterEmailTextField(){
        self.registerEmailTextField.isEnabled = true
        let nextTag = 2
        if let nextTextField = view.viewWithTag(nextTag) as? UITextField {
            nextTextField.becomeFirstResponder()
            registerEmailTextField.addTarget(self, action: #selector(ttextFieldDidEndOnExit), for: .editingDidEndOnExit)
        }
    }
    func disableRegisterEmailTextfield(){
        registerEmailTextField.isEnabled = false
    }
    
    
    @objc func ttextFieldDidEndOnExit() {
        if !registerEmailTextField.validateEmail() {
            disableRegisterPasswordTextField()
        }
        else {
            enableRegisterPasswordTextField()
        }
    }
    func enableRegisterPasswordTextField() {
        let nextTag = 3
        if let nextTextField = view.viewWithTag(nextTag) as? UITextField {
            registerPasswordTextField.isEnabled = true
            nextTextField.becomeFirstResponder()
            registerPasswordTextField.addTarget(self, action: #selector(tttextFieldDidEndOnExit), for: .editingDidEndOnExit)
        }
    }
    func disableRegisterPasswordTextField() {
        self.showAlert(title: "Atenção", message: "E-mail invalido")
        registerPasswordTextField.isEnabled = false
    }
    
    @objc func tttextFieldDidEndOnExit(){
        if self.registerPasswordTextField.validatePassword(){
            self.registerButton.isEnabled = true
            
        } else {
            self.registerButton.isEnabled = false
            self.showAlert(title: "Atenção", message: "Insira a senha com no mínimo 6 caracteres")
        }
    }
 
    func configElements() {
        newAccountLabel.text = "Nova Conta"
        newAccountLabel.textColor = UIColor.black
        
        nameTextField.placeholder = "Digite seu nome"
        nameTextField.delegate = self
        nameTextField.delegate = self
        nameTextField.keyboardType = .namePhonePad
        nameTextField.tag = 1
      
        registerEmailTextField.placeholder = "Digite seu email"
        registerEmailTextField.keyboardType = .emailAddress
        registerEmailTextField.delegate = self
        registerEmailTextField.isEnabled = false
        registerEmailTextField.tag = 2
        
        registerPasswordTextField.placeholder = "Digite uma senha"
        registerPasswordTextField.delegate = self
        registerPasswordTextField.isSecureTextEntry = true
        registerPasswordTextField.isEnabled = false
        registerPasswordTextField.tag = 3
        registerPasswordTextField.textContentType = .oneTimeCode
        
        repeatPasswordTextField.placeholder = "Repita a senha"
        repeatPasswordTextField.delegate = self
        repeatPasswordTextField.isSecureTextEntry = true
        repeatPasswordTextField.isEnabled = false
        repeatPasswordTextField.tag = 4
        repeatPasswordTextField.textContentType = .none
        
        registerButton.setTitle("Cadastrar", for: .normal)
        registerButton.tintColor = UIColor.black
        registerButton.isEnabled = false
        
    }
    
    func showAlert(title:String, message: String) {
        let alertController: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton: UIAlertAction = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(okButton)
        self.present(alertController,animated: true, completion: nil)
    }
    
    func ShowAlertReturnLogin(title: String, message: String){
        let alertController: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertControllerReturnLogin: UIAlertAction = UIAlertAction(title: "OK", style: .default) {(action) in
            self.redirectForLogin()
        }
        alertController.addAction(alertControllerReturnLogin)
        self.present(alertController,animated: true, completion: nil)
    }
    
    func redirectForLogin(){
        self.navigationController?.pushViewController(TabBarController(), animated: true)
    }
}

extension UITextField {
    func validateEmail() -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let validateRegex = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return validateRegex.evaluate (with: self.text)
    }
    func validatePassword() -> Bool {
        let passwordRegex = ".{6,}"
        let validateRegex = NSPredicate (format: "SELF MATCHES %@", passwordRegex)
        return validateRegex.evaluate(with: self.text)
        
    }
    func validateName() -> Bool {
        let passwordRegex = "^[a-zA-Z]{2,}$"
        let validateRegex = NSPredicate (format: "SELF MATCHES %@", passwordRegex)
        return validateRegex.evaluate(with: self.text)
    }
}

extension RegisterVC: UITextFieldDelegate{
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.orange.cgColor
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderWidth = 0
        textField.layer.borderColor = UIColor.gray.cgColor
    }
    
}
