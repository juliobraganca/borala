//
//  ViewController.swift
//  borala
//
//  Created by Julio Braganca on 23/08/23.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configElementsBackground()
        
        
        func configElementsBackground(){
            
            backgroundImageView.image = UIImage(named: "background")
            backgroundImageView.contentMode = .scaleAspectFill
            
        }
    }
}
