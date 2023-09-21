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
        
        registerGreyButton.setTitle("Cadastre-se", for: .normal
        )
        
        forgotPasswordGreyButton.setTitle("Esqueci a senha", for: .normal)

        enterButton.setTitle("Entrar", for: .normal)
    }

}

