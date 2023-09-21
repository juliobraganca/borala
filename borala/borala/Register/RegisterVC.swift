//
//  RegisterVC.swift
//  borala
//
//  Created by Luana Mattana Damin on 20/09/23.
//

import UIKit

class RegisterVC: UIViewController {
    
    @IBOutlet weak var newAccountLabel: UILabel!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var registerEmailTextField: UITextField!
    
    @IBOutlet weak var registerPasswordTextField: UITextField!
    
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    
    @IBOutlet weak var registerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configElements()
    }
    
    @IBAction func tappedBackwardButton(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func tappedRegisterButton(_ sender: UIButton) {
    }
    
    
    func configElements() {
        
        newAccountLabel.text = "Nova Conta"
        
        nameTextField.placeholder = "Digite seu nome"
        
        registerEmailTextField.placeholder = "Digite seu email"
        registerEmailTextField.keyboardType = .emailAddress
        
        registerPasswordTextField.placeholder = "Digite uma senha"
        
        repeatPasswordTextField.placeholder = "Repita a senha"
        
        registerButton.setTitle("Cadastrar", for: .normal)
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
