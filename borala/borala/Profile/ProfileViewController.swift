//
//  ProfileViewController.swift
//  borala
//
//  Created by Eduardo Assis on 04/10/23.
//

import UIKit

class ProfileViewController: UIViewController {
    
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
        configElementsButtons()
        configElementsImageProfile()
       
        
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

        let imageProfilePicker = UIImagePickerController()
        imageProfilePicker.delegate = self
        //imageProfilePicker.sourceType = .camera // captura imagens através da camera.
        imageProfilePicker.sourceType = .photoLibrary // direcionando a origem das imagens: galeria.
        imageProfilePicker.allowsEditing = true // permite a edição da foto.
        present(imageProfilePicker, animated: true) //permissão para acessar galeria.
        print("Captura foto")
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
        nameTextField.placeholder = "Digite seu nome"
        emailTextField.placeholder = "Digite seu e-mail"
        dateOfVBirthTextField.placeholder = "DD/MM/AAAA"
        countryTextField.placeholder = "Digite o pais onde mora"
        cityTextField.placeholder = "Digita cidade onde mora"
        passwordTextField.placeholder = "Trocar senha"
    }
    
    func configElementsButtons(){
        
//        saveButton.setTitle("Salvar", for: .normal)
//        saveButton.backgroundColor = UIColor.orange
//        //saveButton.layer.borderColor = UIColor.lightGray.cgColor
//        saveButton.layer.borderWidth = 1
//        saveButton.setTitleColor(UIColor.white, for: .normal)
//        saveButton.titleLabel?.font = UIFont(name: "Helvetica", size: 10)
//        saveButton.layer.cornerRadius = saveButton.frame.size.width / 8
//        saveButton.clipsToBounds = true
        
//        editProfileButton.setTitle("Edit. Perfil", for: .normal)
//        editProfileButton.backgroundColor = UIColor.orange
//        //editProfileButton.layer.borderColor = UIColor.lightGray.cgColor
//        editProfileButton.layer.borderWidth = 1
//        editProfileButton.setTitleColor(UIColor.white, for: .normal)
//        editProfileButton.titleLabel?.font = UIFont(name: "Helvetica", size: 15)
//        editProfileButton.layer.cornerRadius = editProfileButton.frame.size.width / 8
//        editProfileButton.clipsToBounds = true
        
        saveButton.setupButton(title: "Salvar", isEnabled: true)
        editProfileButton.setupButton(title: "Edit. Perfil", isEnabled: true)
            }
    
    
    func configElementsImageProfile(){
        imageProfileImageView.image = UIImage(systemName: "person.circle.fill")
        imageProfileImageView.contentMode = .scaleAspectFill
        imageProfileImageView.layer.borderColor = UIColor.orange.cgColor
        imageProfileImageView.layer.borderWidth = 1
        imageProfileImageView.layer.cornerRadius = imageProfileImageView.frame.size.width / 2
        imageProfileImageView.clipsToBounds = true
    }
    
    
func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageProfileImageView.image = info[.originalImage] as? UIImage // utilizando a imgem original
        dismiss(animated: true)
    }
}
extension ProfileViewController: UITextFieldDelegate {
    
    public func textFieldDidBeginEditing(_ textField: UITextField) {
        print("textFieldDidBeginEditing")
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.orange.cgColor
    }
    
    public func textFieldDidEndEditing(_ textField: UITextField) {
        print("textFieldDidEndEditing")
        textField.layer.borderWidth = 0
    }
   
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("textFieldShouldReturn")
        textField.resignFirstResponder() //utilizado para esconder o teclado.
        return true
    }
}



    extension  UIViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  
     
     
}

