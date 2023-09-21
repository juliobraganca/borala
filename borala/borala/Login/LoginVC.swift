//
//  ViewController.swift
//  borala
//
//  Created by Julio Braganca on 23/08/23.
//

import UIKit

class LoginVC: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var registerGreyButton: UIButton!
    
    @IBOutlet weak var forgotPasswordGreyButton: UIButton!
    
    @IBOutlet weak var enterButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configElements()
    }

    func configElements() {
        emailTextField.placeholder = "Digite seu e-mail"
        passwordTextField.placeholder = "Digite sua senha"
        
        registerGreyButton.setTitle("Cadastre-se", for: .normal
        )
        
        forgotPasswordGreyButton.setTitle("Esqueci a senha", for: .normal)
        
        enterButton.setTitle("Entrar", for: .normal)
    }

}

