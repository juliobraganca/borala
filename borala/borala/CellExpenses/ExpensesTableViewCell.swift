//
//  ExpensesTableViewCell.swift
//  borala
//
//  Created by Eduardo Assis on 29/09/23.
//

import UIKit

class ExpensesTableViewCell: UITableViewCell {

    @IBOutlet weak var descriptionEXpTexField: UITextField!
    
    @IBOutlet weak var valueExpTextField: UITextField!
    
    static let identfier: String = "ExpensesTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: identfier, bundle: nil)
        
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    func setupCell(){
        
        
    }
    
}
