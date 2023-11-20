//
//  ExpensesTableViewCell.swift
//  borala
//
//  Created by Eduardo Assis on 05/10/23.
//

import UIKit

class ExpensesTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var checkButton: UIButton!
    
    @IBOutlet weak var descriptionTextField: UITextField!
 
    @IBOutlet weak var valueTextField: UITextField!
    
    static let identfier: String = "ExpensesTableViewCell"
    
    let backColor: UIColor? = Color.neutral
    
    static func nib() -> UINib {
        return UINib(nibName: identfier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func tappedCheckButton(_ sender: Any) {
        checkButton.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
    }
    
    func setupCell(data: Cost){
        descriptionTextField.text = data.description
        valueTextField.text = String(data.value)
        checkButton.setImage(UIImage(systemName: "square"), for: .normal)
        
        
        descriptionTextField.backgroundColor = backColor
        valueTextField.backgroundColor = backColor
//        chackButton.backgroundColor = backColor
    }
}
