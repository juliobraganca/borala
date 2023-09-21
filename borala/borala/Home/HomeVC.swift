//
//  HomeVC.swift
//  borala
//
//  Created by Julio Braganca on 21/09/23.
//

import UIKit

class HomeVC: UIViewController {
    
    
    @IBOutlet weak var tabBar: UITabBar!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var addPlanButton: UIButton!
    
//    var places: [String: String] = ["Chile": "Chile",
//                                   "Bali": "Bali",
//                                   "Rio de Janeiro": "RJ",
//                                   "Paris": "paris",
//                                   "Africa do Sul": "southAfrica",
//                                   "Sydney": "sydney",
//                                   "Maceió": "maceio",
//                                   "Ouro Preto": "ouroPreto",
//                                   "Florianópolis": "floripa",
//                                   "Bonito": "BonitoMS",
//                                   "Gramado": "gramado"]
    
    var places: [String] = ["Chile", "Bali", "RJ", "paris", "southAfrica", "sydney", "maceio", "ouroPreto", "floripa", "BonitoMS", "gramado"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureVC()
        configureTabBar()
        configureCollectionView()
        configureButton()
    }
    
    
    func configureVC() {
        view.setBackground()
    }
    
    
    func configureTabBar() {
        tabBar.tintColor = Color.tangerine
        tabBar.isTranslucent = true
//        tabBar.backgroundColor = UIColor.clear
        let map = UITabBarItem(title: "Map", image: UIImage(systemName: "mappin.and.ellipse"), tag: 0)
        let budget = UITabBarItem(title: "Orçamento", image: UIImage(systemName: "dollarsign"), tag: 0)
        let profile = UITabBarItem(title: "Conta", image: UIImage(systemName: "person"), tag: 0)
        tabBar.items = [map, budget, profile]
    }
    
    
    func configureCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.backgroundColor = UIColor.clear
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
            layout.estimatedItemSize = .zero
        }
        
        collectionView.register(HomeCollectionViewCell.nib(), forCellWithReuseIdentifier: HomeCollectionViewCell.identifier)
    }
    
    
    func configureButton() {
        addPlanButton.setupButton(title: "Adicionar Roteiro", isEnabled: true)
    }
}


extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return places.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.identifier, for: indexPath) as? HomeCollectionViewCell
        cell?.setupCell(nameImage: places[indexPath.row])
        return cell ?? UICollectionViewCell()
    }
}
