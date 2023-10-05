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
    
    var places: [Places] = [Places(placeName: "Chile",          imageName: "Chile"),
                            Places(placeName: "Bali",           imageName: "Bali"),
                            Places(placeName: "Rio de Janeiro", imageName: "RJ"),
                            Places(placeName: "Paris",          imageName: "paris"),
                            Places(placeName: "Africa do Sul",  imageName: "southAfrica"),
                            Places(placeName: "Sydney",         imageName: "sydney"),
                            Places(placeName: "Maceió",         imageName: "maceio"),
                            Places(placeName: "Ouro Preto",     imageName: "ouroPreto"),
                            Places(placeName: "Florianópolis",  imageName: "floripa"),
                            Places(placeName: "Bonito",         imageName: "BonitoMS"),
                            Places(placeName: "Gramado",        imageName: "gramado"),]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureVC()
//        configureTabBar()
        configureCollectionView()
        configureButton()
    }
    
    
    func configureVC() {
        view.setBackground()
    }
    
   
    
    
//    func configureTabBar() {
//        tabBar.tintColor = Color.tangerine
//        tabBar.isTranslucent = true
////        tabBar.backgroundColor = UIColor.clear
//        let house = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 0)
//        let map = UITabBarItem(title: "Map", image: UIImage(systemName: "mappin.and.ellipse"), tag: 0)
//        let budget = UITabBarItem(title: "Orçamento", image: UIImage(systemName: "dollarsign"), tag: 0)
//        let profile = UITabBarItem(title: "Conta", image: UIImage(systemName: "person"), tag: 0)
//        tabBar.items = [house, map, budget, profile]
//    }
//
    
    func configureCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(HomeCollectionViewCell.nib(), forCellWithReuseIdentifier: HomeCollectionViewCell.identifier)
        collectionView.backgroundColor = UIColor.clear
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
            layout.estimatedItemSize = .zero
        }
    }
    
    
    func configureButton() {
        addPlanButton.setupButton(title: "Adicionar Roteiro", isEnabled: true)
    }
    
    
    @IBAction func tappedAddPlanButton(_ sender: Any) {
        let addCity = UIStoryboard(name: "AddCityViewController", bundle: nil).instantiateViewController(withIdentifier: "AddCityViewController") as? AddCityViewController
        navigationController?.pushViewController(addCity ?? UIViewController(), animated: true)
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
