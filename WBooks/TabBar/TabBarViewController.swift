//
//  TabBarViewController.swift
//  WBooks
//
//  Created by Ariel Cid on 3/21/18.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Foundation
import UIKit

class TabViewController: UITabBarController {
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.isNavigationBarHidden = true
        
        let libraryNavController = UINavigationController(rootViewController: BookDetailViewController())
        libraryNavController.title = "library.tab-bar.title".localized()
        libraryNavController.tabBarItem.image = #imageLiteral(resourceName: "ic_library")
        libraryNavController.tabBarItem.selectedImage = #imageLiteral(resourceName: "ic_library_active")
        
        let wishlistNavController = UINavigationController(rootViewController: WishlistViewController())
        wishlistNavController.title = "wishlist.tab-bar.title".localized()
        wishlistNavController.tabBarItem.image = #imageLiteral(resourceName: "ic_wishlist")
        wishlistNavController.tabBarItem.selectedImage = #imageLiteral(resourceName: "ic_wishlist_active")
        
        let suggestNavController = UINavigationController(rootViewController: SuggestViewController())
        suggestNavController.title = "suggest.tab-bar.title".localized()
        suggestNavController.tabBarItem.image = #imageLiteral(resourceName: "ic_add_new")
        suggestNavController.tabBarItem.selectedImage = #imageLiteral(resourceName: "ic_add_new_active")
        
        let rentalsNavController = UINavigationController(rootViewController: RentalsViewController())
        rentalsNavController.title = "wishlist.tab-bar.title".localized()
        rentalsNavController.tabBarItem.image = #imageLiteral(resourceName: "ic_myrentals")
        rentalsNavController.tabBarItem.selectedImage = #imageLiteral(resourceName: "ic_myrentals_active")
        
        // swiftlint:disable:next line_length
        setViewControllers([libraryNavController, wishlistNavController, suggestNavController, rentalsNavController], animated: true)
    }
    
}
