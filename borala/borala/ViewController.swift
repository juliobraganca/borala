//
//  ViewController.swift
//  borala
//
//  Created by Julio Braganca on 23/08/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    @IBOutlet weak var imageProfileImageView: UIImageView!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var dateOfVBirthTextField: UITextField!
    
    @IBOutlet weak var countryTextField: UITextField!
    
    @IBOutlet weak var cityTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var saveButton: UIButton!
    
    @IBOutlet weak var editProfileButton: UIButton!
    
    @IBOutlet weak var editImageProfileButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configElementsBackground()
        configElementsTextfield()
        
        
       
        
    }
    
    @IBAction func tappedEditProfileButton(_ sender: UIButton) {
        print("Edit profile")
    }
    
    @IBAction func tappedBackButton(_ sender: UIButton) {
        print("Voltar")
    }
    

    
    @IBAction func tappedSaveButton(_ sender: UIButton) {
        print("Salvando")
    }
    
    @IBAction func tappedEditImageProfileButton(_ sender: UIButton) {
        print("Editando Imagem")
    }
    
    
    func configElementsBackground(){
        backgroundImageView.image = UIImage(named: "background")
        backgroundImageView.contentMode = .scaleAspectFill
        
    }
    
    
    func configElementsTextfield(){
        
        //Assinando contratos
        nameTextField.delegate = self
        emailTextField.delegate = self
        dateOfVBirthTextField.delegate = self
        countryTextField.delegate = self
        cityTextField.delegate = self
        passwordTextField.delegate = self
        
        //Configurando Teclados
        nameTextField.keyboardType = .namePhonePad
        emailTextField.keyboardType = .emailAddress
        dateOfVBirthTextField.keyboardType = .numberPad
        countryTextField.keyboardType = .namePhonePad
        cityTextField.keyboardType = .namePhonePad
        passwordTextField.keyboardType = .namePhonePad
        
        //Placeholder
        dateOfVBirthTextField.placeholder = "DD/MM/AAAA"
        countryTextField.placeholder = "Digite o pais onde mora"
        cityTextField.placeholder = "Digita cidade onde mora"
        passwordTextField.placeholder = "Trocar senha"
    }
    
    func configElementsButtons(){
        
        saveButton.setTitle("Salvar", for: .normal)
        
        
    }
}
extension ViewController: UITextFieldDelegate {
    
    
    
    // este método é disparado sempre que clica no teclado
    public func textFieldDidBeginEditing(_ textField: UITextField) {
        print("textFieldDidBeginEditing")
        textField.layer.borderWidth = 3
        textField.layer.borderColor = UIColor.orange.cgColor
    }
    //este método é disparado quando o teclado some.
    public func textFieldDidEndEditing(_ textField: UITextField) {
        print("textFieldDidEndEditing")
        textField.layer.borderWidth = 0
    }
    //este método dispara quando clica no retorno.
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("textFieldShouldReturn")
        textField.resignFirstResponder() //utilizado para esconder o teclado.
        return true
    }
    
}
