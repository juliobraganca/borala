//
//  ForgotPasswordVC.swift
//  borala
//
//  Created by Julio Braganca on 21/09/23.
//

import UIKit
import FirebaseAuth
import Firebase

class ForgotPasswordVC: UIViewController {
    
    
    
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var confirmButton: UIButton!
    
    var auth: Auth?
    override func viewDidLoad() {
        super.viewDidLoad()
        //        configureVC()
        configureImageView()
        configureTextField()
        configureButton()
        self.auth = Auth.auth()
    }
    
    
    //    func configureVC() {
    //        view.setBackground()
    //    }
    
    
    func configureImageView() {
        logoImageView.image = Images.logo
    }
    
    
    func configureTextField() {
        //        emailTextField.setupTextField(placeholder: "Insira seu email", delegate: self)
        emailTextField.placeholder = "Digite seu email"
        emailTextField.keyboardType = .emailAddress
        emailTextField.delegate = self
        
    }
    
    
    func configureButton() {
        confirmButton.setTitle("Enviar", for: .normal)
        confirmButton.tintColor = UIColor.black
        
    }
    
    
    @IBAction func tappedConfirmButton(_ sender: UIButton) {
        
        let email:String = emailTextField.text ?? ""
        
        if let text = emailTextField.text, text.isEmpty {
            self.showAlert(title: "Erro!" , message: "Ops! Parece que o campo de email está vazio. Preencha e tente novamente.")
            
            
        } else {
            
            auth?.sendPasswordReset(withEmail: email) { (error) in
                
                if let error = error {
                    self.showAlert(title: "Erro!" , message: "Erro ao enviar email de redefinição de senha: \(error.localizedDescription)")
                    
                } else {
                    self.showAlert(title: "Sucesso!" , message: "Email de redefinição de senha enviado com sucesso. Verifique sua caixa de entrada.")
                   
                                   }
                
            }
        }
    }
}
    

extension ForgotPasswordVC: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.isEditingTextField()
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.isTextFieldEmpty()
        //enableButton()
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
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
        
        //
        //    func enableButton() {
        //        if emailTextField.hasText {
        //            confirmButton.isEnabled = true
        //        } else {
        //            confirmButton.isEnabled = false
        //        }
        //    }
        
    }
    
