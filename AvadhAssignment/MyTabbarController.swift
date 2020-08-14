//
//  MyTabbarController.swift
//  AvadhAssignment
//
//  Created by Avadh Mewada on 8/13/20.
//  Copyright © 2020 Avadh. All rights reserved.
//

import UIKit

class MyTabbarController : UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewControllers()
    }
    
    private func setupViewControllers() {
        let homeVC = createNavVCController(vc: ViewController(), selectedImage: #imageLiteral(resourceName: "house"), image: #imageLiteral(resourceName: "house"))
        let searchVC = createNavVCController(vc: UIViewController(), selectedImage: #imageLiteral(resourceName: "search"), image: #imageLiteral(resourceName: "search"))
        let searchVC1 = createNavVCController(vc: UIViewController(), selectedImage: #imageLiteral(resourceName: "search"), image: #imageLiteral(resourceName: "search"))
        let searchVC2 = createNavVCController(vc: UIViewController(), selectedImage: #imageLiteral(resourceName: "search"), image: #imageLiteral(resourceName: "search"))
        let searchVC3 = createNavVCController(vc: UIViewController(), selectedImage: #imageLiteral(resourceName: "search"), image: #imageLiteral(resourceName: "search"))
            
        self.viewControllers = [homeVC, searchVC, searchVC1, searchVC2, searchVC3]
    }
    
    private func createNavVCController(vc: UIViewController, selectedImage: UIImage?, image: UIImage?) -> UIViewController {
        let navVC = UINavigationController(rootViewController: vc)
        navVC.tabBarItem.selectedImage = selectedImage
        navVC.tabBarItem.image = image
        return navVC
    }
    
    
}
