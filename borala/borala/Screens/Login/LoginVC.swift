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
                self.showAllert(title: "Atenção", message: "Verifique se os dados inseridos estão corretos e tente novamente")
                print("Dados incorretos! ")
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
        passwordTextField.isSecureTextEntry = true
        
        registerGreyButton.setTitle("Cadastre-se", for: .normal)
        registerGreyButton.setTitleColor(UIColor.black, for: .normal)
        
        forgotPasswordGreyButton.setTitle("Esqueci a senha", for: .normal)
        forgotPasswordGreyButton.setTitleColor(UIColor.black, for: .normal)

        enterButton.setTitle("Entrar", for: .normal)
        enterButton.tintColor = UIColor.black
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = Color.tangerine.cgColor
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderWidth = 0
        textField.layer.borderColor = Color.neutral.cgColor
      }
    
    func showAllert(title:String, message:String){
        let alertErroLogin: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton: UIAlertAction = UIAlertAction(title:"OK", style: .default)
        alertErroLogin.addAction(okButton)
        self.present(alertErroLogin, animated: true, completion: nil)
        
    }

}
