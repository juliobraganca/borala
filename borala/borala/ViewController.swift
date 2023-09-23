//
//  ViewController.swift
//  borala
//
//  Created by Julio Braganca on 23/08/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var bacgroundImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       configElements()
       
        
        
    }
    
    func configElements(){
       
        bacgroundImageView.image = UIImage(named: "background")
        bacgroundImageView .contentMode = .scaleToFill
        
    }
    
}
