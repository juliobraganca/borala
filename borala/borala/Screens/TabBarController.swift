//
//  TabBarController.swift
//  borala
//
//  Created by Luana Mattana Damin on 05/10/23.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addControllers()
        configLayout()
        
    }
    
    func addControllers() {
        
        let home: UINavigationController = {
            let vc = UIStoryboard(name: "HomeVC", bundle: nil).instantiateViewController(withIdentifier: "HomeVC") as? HomeVC
            let nav = UINavigationController(rootViewController: vc ?? UIViewController())
            nav.tabBarItem = UITabBarItem(title: "Roteiros", image: UIImage(systemName: "house"), tag: 0)
            return nav
        }()
        
        let maps: UINavigationController = {
            let vc = UIStoryboard(name: "MapsVC", bundle: nil).instantiateViewController(withIdentifier: "MapsVC") as? MapsVC
            let nav = UINavigationController(rootViewController: vc ?? UIViewController())
            nav.tabBarItem = UITabBarItem(title: "Mapa", image: UIImage(systemName: "mappin.and.ellipse"), tag: 1)
            return nav
        }()
        
        let budget: UINavigationController = {
            let vc = UIStoryboard(name: "BudgetViewController", bundle: nil).instantiateViewController(withIdentifier: "BudgetViewController") as? BudgetViewController
            let nav = UINavigationController(rootViewController: vc ?? UIViewController())
            nav.tabBarItem = UITabBarItem(title: "Orçamento", image: UIImage(systemName: "dollarsign"), tag: 2)
            return nav
        }()
        
        let profile: UINavigationController = {
            let vc = UIStoryboard(name: "ProfileViewController", bundle: nil).instantiateViewController(withIdentifier: "ProfileViewController") as? ProfileViewController
            let nav = UINavigationController(rootViewController: vc ?? UIViewController())
            nav.tabBarItem = UITabBarItem(title: "Perfil", image: UIImage(systemName: "person"), tag: 3 )
            return nav
        }()
        
        viewControllers = [home, maps, budget, profile]
    }
    
    func configLayout() {
        tabBar.layer.borderWidth = 0.2
        tabBar.layer.borderColor = UIColor.black.cgColor
        tabBar.backgroundColor = .white
    }
    
   
    

}

