//
//  ForgotPasswordVC.swift
//  borala
//
//  Created by Julio Braganca on 21/09/23.
//

import UIKit
import Firebase

class ForgotPasswordVC: UIViewController {
    
    
    
    @IBOutlet weak var returnButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var confirmButton: UIButton!
    
    var auth: Auth?
    override func viewDidLoad() {
        super.viewDidLoad()
        configureButton()
        configureImageView()
        configElementes()
        self.auth = Auth.auth()
    }
    
    func configureImageView() {
        logoImageView.image = Images.logo
    }
    
    func configElementes() {
        emailTextField.placeholder = "Digite seu email"
        emailTextField.keyboardType = .emailAddress
        emailTextField.delegate = self
        
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .black
        view.backgroundColor = .systemGray5
        
        titleLabel.text = " Recuperar Senha"
        titleLabel.textColor = .black

    }
    
    func configureButton() {
        confirmButton.setTitle("Enviar", for: .normal)
        confirmButton.tintColor = UIColor.black
    }
  
    @IBAction func tappedReturnButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: false)
    }
    @IBAction func tappedConfirmButton(_ sender: UIButton) {
        if self.emailTextField.validateEmail() {
            let email:String = emailTextField.text ?? ""
            auth?.sendPasswordReset(withEmail: email) { (error) in
                if error != nil {
                    self.showalertError(title: "Erro!" , message: "Erro ao enviar email de redefinição de senha.")
                } else {
                    self.showAlert(title: "Sucesso!" , message: "Email de redefinição de senha enviado com sucesso. Verifique sua caixa de entrada!")
                }
            }
        } else {
            self.showalertError(title: "Erro!" , message: "Verifique os dados inseridos e tente novamente!")
        }
    }
}

extension ForgotPasswordVC: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.isEditingTextField()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.isTextFieldEmpty()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
        
    }
    
    func showalertError(title:String, message:String ){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert )
        let okButton: UIAlertAction = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(okButton)
        self.present(alertController,animated: true, completion: nil)
    }
    
    
    func showAlert(title:String, message: String) {
        let alertController: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertControllerReturnLogin: UIAlertAction = UIAlertAction(title: "OK", style: .default) {(action) in
            self.redirectForLogin()
        }
        alertController.addAction(alertControllerReturnLogin)
        self.present(alertController,animated: true, completion: nil)
    }
    
    func redirectForLogin(){
        if let loginVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginVC") as? LoginVC {
            self.navigationController?.pushViewController(loginVC, animated: true)
        }
    }
}

