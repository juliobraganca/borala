//
//  BudgetViewController.swift
//  borala
//
//  Created by Eduardo Assis on 04/10/23.
//

import UIKit

class BudgetViewController: UIViewController {
    
    //@IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var sppentsImageView: UIImageView!
    @IBOutlet weak var budgetTableView: UITableView!
    @IBOutlet weak var addbudgetButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
//    @IBOutlet weak var sumButton: UIButton!
    
    var budgetList: [Cost] = [Cost(description: "Ingresso Pão de Açucar", value: 56, check: true),
                              Cost(description: "Ingresso Fla x Vasco", value: 200, check: true),
                              Cost( description: "Jantar no Oro", value: 500, check: true),
                              Cost(description: "Uber Urca", value: 45, check: true),
                              Cost(description: "Açai Ipanema", value: 40, check: true),]
    
    var budgetListSum: Double = 0 {
        didSet {
            resultLabel.text = "\(budgetListSum)"
        }
    }
    
    var newItemDescription: String = ""
    var newItemValue: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        configElementsBackground()
        ConfigElementesSppents()
        configElementsTableView()
        sumItems()
    }
    
    
    //    @IBAction func tappedBackButton(_ sender: UIButton) {
    //        print("Voltar")
    //    }
    
    @IBAction func tappedAddButton(_ sender: UIButton) {
        addNewItemAlert()
        print("Adicionado uma nova celula")
    }
    
    @IBAction func tappedSumButton(_ sender: UIButton) {
        sumItems()
        print("Somar")
    }
    
    //    func configElementsBackground(){
    //        backgroundImageView.image = UIImage(named: "background")
    //        backgroundImageView.contentMode = .scaleToFill
    //    }
    //
    
    func ConfigElementesSppents(){
        sppentsImageView.image = UIImage(named: "spents")
        sppentsImageView.contentMode = .scaleToFill
        addbudgetButton.setupButton(title: "Adicionar novo Item", isEnabled: true)
        addbudgetButton.tintColor = UIColor.black
//        sumButton.setupButton(title: "Somar", isEnabled: true)
//        sumButton.tintColor = UIColor.black
    }
    
    func configElementsTableView(){
        budgetTableView.backgroundColor = UIColor.clear
        budgetTableView.delegate = self
        budgetTableView.dataSource = self
        budgetTableView.register(ExpensesTableViewCell.nib(), forCellReuseIdentifier:ExpensesTableViewCell.identfier)
    }
    
    func addNewItemAlert(){
        let ac = UIAlertController(title: "Informe o novo item e o valor", message: nil, preferredStyle: .alert)
        ac.addTextField() { (textField : UITextField!) in
            textField.placeholder = "Descrição do item"
        }
        ac.addTextField() { (textField : UITextField!) in
            textField.placeholder = "Valor do item"
        }
        
        let okAction = UIAlertAction(title: "OK", style: .default) {
            [weak self, weak ac] action in
            guard let description = ac?.textFields?[0].text else { return }
            guard let value = ac?.textFields?[1].text else { return }
            self?.addNewItem(description: description, value: value)
        }
        
        ac.addAction(okAction)
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(ac, animated: true)
    }
    
    
    func addNewItem(description: String, value: String) {
        let newItem = Cost(description: description, value: Double(value) ?? 0, check: true)
        budgetList.append(newItem)
        budgetTableView.reloadData()
        sumItems()
    }

    
    func sumItems(){
        budgetListSum = 0
        for i in 0..<budgetList.count {
            budgetListSum += budgetList[i].value
        }
    }
}


extension BudgetViewController: UITableViewDataSource {
    func tableView(_ budgetTableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return budgetList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let Cell = budgetTableView.dequeueReusableCell(withIdentifier: ExpensesTableViewCell.identfier, for: indexPath) as? ExpensesTableViewCell
        
        Cell?.setupCell(data: budgetList[indexPath.row])
        
        return Cell ?? UITableViewCell()
    }
    
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            budgetList.remove(at: indexPath.row)
//            budgetTableView.deleteRows(at: [indexPath], with: .fade)
//        }
//    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            budgetList.remove(at: indexPath.row)
            budgetTableView.deleteRows(at: [indexPath], with: .fade)
            sumItems()
        }
    }
    
}

extension BudgetViewController: UITableViewDelegate {
    //
}
