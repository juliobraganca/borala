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
    
    
    var places: [Places] = [Places(placeName: "Chile", nameImage: "Chile"),
                            Places(placeName: "Bali", nameImage: "Bali"),
                            Places(placeName: "Rio de Janeiro", nameImage: "RJ"),
                            Places(placeName: "Paris", nameImage: "paris"),
                            Places(placeName: "Africa do Sul", nameImage: "southAfrica"),
                            Places(placeName: "Sydney", nameImage: "sydney"),
                            Places(placeName: "Maceió", nameImage: "maceio"),
                            Places(placeName: "Ouro Preto", nameImage: "ouroPreto"),
                            Places(placeName: "Florianópolis", nameImage: "floripa"),
                            Places(placeName: "Bonito", nameImage: "BonitoMS"),
                            Places(placeName: "Gramado", nameImage: "gramado"),
    ]
    
    
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
        cell?.setupCell(places: places[indexPath.row])
        return cell ?? UICollectionViewCell()
    }
}
