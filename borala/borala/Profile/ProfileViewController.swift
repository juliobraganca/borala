//
//  ProfileViewController.swift
//  borala
//
//  Created by Eduardo Assis on 04/10/23.
//

import UIKit
import Firebase
import FacebookLogin

class ProfileViewController: UIViewController {
    
        
    @IBOutlet weak var imageProfileButton: UIButton!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var dateOfVBirthTextField: UITextField!
    
    @IBOutlet weak var countryTextField: UITextField!
    
    @IBOutlet weak var cityTextField: UITextField!
    
    
    @IBOutlet weak var saveButton: UIButton!
    
    @IBOutlet weak var editProfileButton: UIButton!
    
    
    var profileImage: UIImage!
    var auth: Auth?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configElementsTextfield()
        configElementsButtons()
        configElementsImageProfile()
        notEditableFields()
        self.auth = Auth.auth()
        saveButton.isHidden = true
    }
    
    @IBAction func tappedEditProfileButton(_ sender: Any) {
        let ac = UIAlertController(title: nil, message: "Você pode editar os campos", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
        editableFields()
        saveButton.isHidden = false
        editProfileButton.isHidden = true
    }
    
    
    @IBAction func tappedSaveButton(_ sender: Any) {
        let ac = UIAlertController(title: nil, message: "Informações salvas!", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
        notEditableFields()
        editProfileButton.isHidden = false
        saveButton.isHidden = true
    }
    
    @IBAction func tappedImageProfileButton(_ sender: Any) {
        let imageProfilePicker = UIImagePickerController()
        imageProfilePicker.delegate = self
        imageProfilePicker.sourceType = .camera // captura imagens através da camera.
        imageProfilePicker.sourceType = .photoLibrary // direcionando a origem das imagens: galeria.
        imageProfilePicker.allowsEditing = true // permite a edição da foto.
        present(imageProfilePicker, animated: true) //permissão para acessar galeria.
        print("Captura foto")
    }
    
    @IBAction func tappedLogoutButton(_ sender: Any) {
        logoutFromFirebase()
        logoutFromFacebook()
        let loginVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginVC") as? LoginVC
        navigationController?.pushViewController(loginVC ?? UIViewController(), animated: true)
    }
    
    func configElementsTextfield(){
        
        //Assinando contratos
        nameTextField.delegate = self
        emailTextField.delegate = self
        dateOfVBirthTextField.delegate = self
        countryTextField.delegate = self
        cityTextField.delegate = self
        
        //Configurando Teclados
        nameTextField.keyboardType = .namePhonePad
        emailTextField.keyboardType = .emailAddress
        dateOfVBirthTextField.keyboardType = .numberPad
        countryTextField.keyboardType = .namePhonePad
        cityTextField.keyboardType = .namePhonePad
        
        //Placeholder
        nameTextField.placeholder = "Digite seu nome"
        emailTextField.placeholder = "Digite seu e-mail"
        dateOfVBirthTextField.placeholder = "DD/MM/AAAA"
        countryTextField.placeholder = "Digite o pais onde mora"
        cityTextField.placeholder = "Digita cidade onde mora"
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
        editProfileButton.setupButton(title: "Editar Perfil", isEnabled: true)
    }
    
    
    func configElementsImageProfile(){
        imageProfileButton.setImage(UIImage(systemName: "person.circle.fill"), for: .normal)
        //        imageProfileButton.contentHorizontalAlignment = .fill
        //        imageProfileButton.contentVerticalAlignment = .fill
        imageProfileButton.imageView?.contentMode = .scaleAspectFit
        imageProfileButton.imageView?.tintColor = .black
        //        imageProfileButton.contentMode = .scaleToFill
        imageProfileButton.layer.cornerRadius = imageProfileButton.frame.size.width / 2
        imageProfileButton.clipsToBounds = true
    }
    
    
    func notEditableFields() {
        nameTextField.isEnabled = false
        emailTextField.isEnabled = false
        dateOfVBirthTextField.isEnabled = false
        countryTextField.isEnabled = false
        cityTextField.isEnabled = false
    }
    
    
    func editableFields() {
        nameTextField.isEnabled = true
        emailTextField.isEnabled = true
        dateOfVBirthTextField.isEnabled = true
        countryTextField.isEnabled = true
        cityTextField.isEnabled = true
    }
    
    func logoutFromFacebook() {
        let loginManager = LoginManager()
        loginManager.logOut()
    }
    
    func logoutFromFirebase(){
        let firebaseAuth = Auth.auth()
        do {
          try firebaseAuth.signOut()
        } catch let signOutError as NSError {
          print("Error signing out: %@", signOutError)
        }

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
        textField.resignFirstResponder()
        return true
    }
}


    extension  ProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  
        public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            guard let image = info[.editedImage] as? UIImage else { return }
            dismiss(animated: true)
            
            imageProfileButton.setImage(image, for: .normal)
//            imageProfileButton.contentHorizontalAlignment = .fill
//            imageProfileButton.contentVerticalAlignment = .fill
//            imageProfileButton.imageView?.contentMode = .scaleAspectFit
        }
     
}

