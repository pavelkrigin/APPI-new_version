//
//  TabBarController.swift
//  APPI
//
//  Created by Pavel Krigin on 10.9.22..
//

import UIKit


final class TabBarController: UITabBarController {
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        tabBar.standardAppearance = appearance
        tabBar.scrollEdgeAppearance = appearance
    }
}
