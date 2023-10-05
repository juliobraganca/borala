//
//  ExpensesTableViewCell.swift
//  borala
//
//  Created by Eduardo Assis on 05/10/23.
//

import UIKit

class ExpensesTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var chackButton: UIButton!
    
    @IBOutlet weak var descriptionTextField: UITextField!
    
    @IBOutlet weak var valueTextField: UITextField!
    
    
    static let identfier: String = "ExpensesTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: identfier, bundle: nil)
        
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
    }

    func setupCell(date: Cost){
        descriptionTextField.text = date.description
        valueTextField.text = date.value
        if date.check {
            chackButton.tintColor = .blue
        }else {
            chackButton.tintColor = .systemPink

        }
        
    }
    
}
