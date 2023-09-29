//
//  ViewController.swift
//  borala
//
//  Created by Julio Braganca on 23/08/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var backgroundImageView: UIImageView!
    
    @IBOutlet weak var sppentsImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configElementsBackground()
        ConfigElementesSppents()
    }

    
   func configElementsBackground(){
       backgroundImageView.image = UIImage(named: "background")
       backgroundImageView.contentMode = .scaleToFill
    }
    
    func ConfigElementesSppents(){
        sppentsImageView.image = UIImage(named: "sppent")
        sppentsImageView.contentMode = .scaleToFill
        
  
         
     }
}

