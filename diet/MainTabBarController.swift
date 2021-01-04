//
//  MainTabBarController.swift
//  diet
//
//  Created by 杉本靖樹 on 2021/01/03.
//

import Foundation
import UIKit


class MainTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBar.appearance().barTintColor = .white
        setupTab()
    }
}

private extension MainTabBarController {
    func setupTab() {
        let firstViewController = DietViewController()
        firstViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .history, tag: 0)
        let secondViewController = AnalsysViewController()
        secondViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .downloads, tag: 0)
        viewControllers = [firstViewController, secondViewController]
    }
}
