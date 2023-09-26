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
    
    @IBOutlet weak var CityTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var saveButton: UIButton!
    
    @IBOutlet weak var editProfileButton: UIButton!
    
    @IBOutlet weak var editImageProfileButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configElementsBackground()
        
        
        func configElementsBackground(){
            backgroundImageView.image = UIImage(named: "background")
            backgroundImageView.contentMode = .scaleAspectFill
            
        }
    }
}
