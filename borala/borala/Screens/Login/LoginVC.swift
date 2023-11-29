//
//  ViewController.swift
//  borala
//
//  Created by Julio Braganca on 23/08/23.
//

import UIKit
import Firebase
import GoogleSignIn
import FacebookLogin



class LoginVC: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var registerGreyButton: UIButton!
    
    @IBOutlet weak var forgotPasswordGreyButton: UIButton!
    
    @IBOutlet weak var enterButton: UIButton!
    
    var auth: Auth?
    let facebookLoginButton = FBLoginButton(frame: .zero)
    
    var alert: Alert?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configElements()
        self.auth = Auth.auth()
        checkLogin()
        self.tabBarController?.tabBar.isHidden = true
        self.alert = Alert(controller: self)
      
      
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
        self.tabBarController?.tabBar.isHidden = true
        navigationController?.navigationBar.tintColor = Color.tangerine
    }
    
    @IBAction func tappedEnterButton(_ sender: UIButton) {
        signIn()
    }
    
    @IBAction func tappedRegisterButton(_ sender: UIButton) {
        let registerScreen = UIStoryboard(name: "RegisterVC", bundle: nil).instantiateViewController(withIdentifier: "RegisterVC") as? RegisterVC
        navigationController?.pushViewController(registerScreen ?? UIViewController(), animated: true)
    }
    
    @IBAction func tappedForgotPasswordButton(_ sender: UIButton) {
        let forgotPasswordVC = UIStoryboard(name: "ForgotPasswordVC", bundle: nil).instantiateViewController(withIdentifier: "ForgotPasswordVC") as? ForgotPasswordVC
        navigationController?.pushViewController(forgotPasswordVC ?? UIViewController(), animated: true)
    }
    
    @IBAction func tappedFacebookButton(_ sender: Any) {
        facebookLoginButton.delegate = self
        facebookLoginButton.isHidden = true
        facebookLoginButton.sendActions(for: .touchUpInside)
    }
    
    @IBAction func tappedGoogleButton(_ sender: Any) {
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config
        GIDSignIn.sharedInstance.signIn(withPresenting: self) { [unowned self] result, error in
            guard error == nil else {
                return
            }
            guard let user = result?.user,
                  let idToken = user.idToken?.tokenString
            else {
                return
            }
            _ = GoogleAuthProvider.credential(withIDToken: idToken,
                                              accessToken: user.accessToken.tokenString)
            self.navigationController?.pushViewController(TabBarController(), animated: true)
        }
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
        
        facebookLoginButton.delegate = self
        facebookLoginButton.isHidden = true
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
    func checkLogin() {
        if AccessToken.current != nil || Auth.auth().currentUser != nil{
            self.navigationController?.pushViewController(TabBarController(), animated: false)
            self.navigationController?.navigationBar.isHidden = true
        } else {
            
        }
    }
    func signIn(){
        let email:String = self.emailTextField.text ?? ""
        let password: String = self.passwordTextField.text ?? ""
        
        self.auth?.signIn(withEmail: email, password: password) { (usuario, error) in
            if error != nil {
                self.alert?.getAlert(title: AlertStrings.atention.rawValue, message: AlertStrings.errorMessage.rawValue)
            }else{
                self.navigationController?.pushViewController(TabBarController(), animated: true)
            }
        }
    }
    
}

extension LoginVC: LoginButtonDelegate {
    
    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
        if error != nil {
            showAllert(title: "Atencão", message: "Erro ao logar com facebook")
            
        } else if result?.isCancelled == true {
            showAllert(title: "Atencão", message: "Você cancelou o acesso pelo facebook")
            
        } else {
            self.navigationController?.pushViewController(TabBarController(), animated: true)
        }
    }
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginKit.FBLoginButton) {
        
    }
    
    
}
