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
    
 
    @IBOutlet weak var budgetTableView: UITableView!
    
    
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
        sppentsImageView.image = UIImage(named: "spents")
        sppentsImageView.contentMode = .scaleToFill
    
        func configElementsTableView(){
            //budgetTableView.backgroundColor = .systemBackground.self
            budgetTableView.delegate = self
            budgetTableView.dataSource = self
        }

     }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4 //expenses.count ()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
}
extension ViewController: UITableViewDelegate {
    
    
}
