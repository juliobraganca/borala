//
//  ViewController.swift
//  borala
//
//  Created by Julio Braganca on 23/08/23.
//

import UIKit
import Firebase


class LoginVC: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var registerGreyButton: UIButton!
    
    @IBOutlet weak var forgotPasswordGreyButton: UIButton!
    
    @IBOutlet weak var enterButton: UIButton!
    
    var auth: Auth?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configElements()
        self.auth = Auth.auth()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        self.navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.tintColor = Color.tangerine
    }
    
    @IBAction func tappedEnterButton(_ sender: UIButton) {
        
        let email:String = self.emailTextField.text ?? ""
        let password: String = self.passwordTextField.text ?? ""
        
        self.auth?.signIn(withEmail: email, password: password) { (usuario, error) in
            if error != nil {
                print("Dados incorretos")
            }else{
                print("Login com sucesso")
                self.navigationController?.pushViewController(TabBarController(), animated: true)
            }
        }
    }
    
    
    @IBAction func tappedRegisterButton(_ sender: UIButton) {
        let registerScreen = UIStoryboard(name: "RegisterVC", bundle: nil).instantiateViewController(withIdentifier: "RegisterVC") as? RegisterVC
        navigationController?.pushViewController(registerScreen ?? UIViewController(), animated: true)
    }
    
    
    @IBAction func tappedForgotPasswordButton(_ sender: UIButton) {
        let forgotPasswordVC = UIStoryboard(name: "ForgotPasswordVC", bundle: nil).instantiateViewController(withIdentifier: "ForgotPasswordVC") as? ForgotPasswordVC
        navigationController?.pushViewController(forgotPasswordVC ?? UIViewController(), animated: true)
    }
    
    
    
    func configElements() {
        emailTextField.placeholder = "Digite seu e-mail"
        emailTextField.keyboardType = .emailAddress
        emailTextField.delegate = self
        
        
        passwordTextField.placeholder = "Digite sua senha"
        passwordTextField.delegate = self
        
        registerGreyButton.setTitle("Cadastre-se", for: .normal)
        registerGreyButton.layer.borderColor = Color.tangerine.cgColor
        registerGreyButton.layer.borderWidth = 1.0
        registerGreyButton.layer.borderColor = Color.tangerine.cgColor
        registerGreyButton.layer.cornerRadius = 10.0
        registerGreyButton.clipsToBounds = true
        registerGreyButton.backgroundColor = Color.tangerine
        registerGreyButton.setTitleColor(Color.neutral, for: .normal)
        
        
        forgotPasswordGreyButton.setTitle("Esqueci a senha", for: .normal)
        forgotPasswordGreyButton.layer.borderColor = Color.tangerine.cgColor
        forgotPasswordGreyButton.layer.borderWidth = 1.0
        forgotPasswordGreyButton.layer.borderColor = Color.tangerine.cgColor
        forgotPasswordGreyButton.layer.cornerRadius = 10.0
        forgotPasswordGreyButton.clipsToBounds = true
        forgotPasswordGreyButton.backgroundColor = Color.tangerine
        forgotPasswordGreyButton.setTitleColor(Color.neutral, for: .normal)

        enterButton.setTitle("Entrar", for: .normal)
        enterButton.tintColor = Color.tangerine
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = Color.tangerine.cgColor
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderWidth = 0
        textField.layer.borderColor = Color.neutral.cgColor
      }


}

