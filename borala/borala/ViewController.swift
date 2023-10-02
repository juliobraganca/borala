//
//  ViewController.swift
//  borala
//
//  Created by Julio Braganca on 23/08/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    @IBOutlet weak var sppentsImageView: UIImageView!
    
    @IBOutlet weak var budgetTableView: UITableView!
    
    @IBOutlet weak var addbudgetButton: UIButton!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var sumButton: UIButton!
    
    
    let newresult: Double = 0
    
    
    var list: [Cost] = [Cost(description: "Ingresso Pão de Açucar", value: "56", check: true),
                        Cost(description: "Ingresso Fla x Vasco", value: "200", check: true),
                        Cost( description: "Jantar no Oro", value: "500", check: true),
                        Cost(description: "Uber Urca", value: "45", check: true),
                        Cost(description: "Açai Ipanema", value: "40", check: true),
                        Cost(description: "Bike Itau", value: "56", check: true),
                        Cost(description: "Ingresso Pão de Açucar", value: "100", check: true),
                        Cost( description: "Jantar no Oro", value: "500", check: true),
                        Cost(description: "Uber Urca", value: "45", check: true),
                        Cost(description: "Açai Ipanema", value: "40", check: true),
                        Cost(description: "Bike Itau", value: "56", check: true),
                        Cost(description: "Ingresso Pão de Açucar", value: "100", check: true),
    ]
   
    override func viewDidLoad() {
        super.viewDidLoad()
        configElementsBackground()
        ConfigElementesSppents()
        configElementsTableView()
        resultLabel.text = " R$ \(newresult)"
    }
    
    
    @IBAction func tappedBackButton(_ sender: UIButton) {
        print("Voltar")
    }
    
    @IBAction func tappedAddButton(_ sender: UIButton) {
        addNewItem()
        print("Adicionado uma nova celula")
    }
    
    @IBAction func tappedSumButton(_ sender: UIButton) {
        print("Somar")
    }
    
    func configElementsBackground(){
        backgroundImageView.image = UIImage(named: "background")
        backgroundImageView.contentMode = .scaleToFill
    }
    
    
    func ConfigElementesSppents(){
        sppentsImageView.image = UIImage(named: "spents")
        sppentsImageView.contentMode = .scaleToFill
    }
    func configElementsTableView(){
        budgetTableView.backgroundColor = UIColor.clear
        budgetTableView.delegate = self
        budgetTableView.dataSource = self
        budgetTableView.register(ExpensesTableViewCell.nib(), forCellReuseIdentifier:ExpensesTableViewCell.identfier)
    }
    
    func addNewItem(){
        let newItem = Cost(description: "", value: "", check: true)
        list.append(newItem)
        budgetTableView.reloadData()
        
        
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ budgetTableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let Cell = budgetTableView.dequeueReusableCell(withIdentifier: ExpensesTableViewCell.identfier, for: indexPath) as? ExpensesTableViewCell
        
        Cell?.setupCell(date: list[indexPath.row])
        
        return Cell ?? UITableViewCell()
    }
    
}
extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didBeginMultipleSelectionInteractionAt indexPath: IndexPath) {
        print("")
    }
    
}
