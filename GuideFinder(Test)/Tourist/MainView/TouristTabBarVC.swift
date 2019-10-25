//
//  TabBarVCViewController.swift
//  GuideFinder(Test)
//
//  Created by Nathan on 19/09/2019.
//  Copyright © 2019 Nathan. All rights reserved.
//

import UIKit

class TouristTabBarVC: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createController()
        
    }
    
    
    
    func createController() {
        //view.backgroundColor = .init(red: 20.0, green: 44.0, blue: 60.0, alpha: 1.0)
        
        let shop = TouristHomeVC()
        shop.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "home"), tag: 1)
        //shop.tabBarItem = UITabBarItem(tabBarSystemItem: UIImage(named: "shop"), tag: 1)
    
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: UIImageView(image: UIImage(named: "settings")!))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: UIImageView(image: UIImage(named: "avatar")!))
        
        UITabBar.appearance().tintColor = .orange
        self.view.backgroundColor = #colorLiteral(red: 0.8747859597, green: 0.8695861697, blue: 0.8787831664, alpha: 1)
        
        let news = SettingViewController()
        //news.tabBarItem = UITabBarItem(title: "News", image: UIImage(named:"news"), tag: 2)
        news.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "news"), tag: 2)
        
        let favourites = FavouritesViewController()
        //favourites.tabBarItem = UITabBarItem(title: "Favourites", image: UIImage(named: "favourite"), tag: 3)
        favourites.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "favourite"), tag: 3)
        
        self.viewControllers = [shop, news, favourites]
    }
    
    
    
}

