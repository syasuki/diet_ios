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
        UINavigationBar.appearance().tintColor = UIColor.white
        UINavigationBar.appearance().barTintColor = .orange
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        UITabBar.appearance().barTintColor = .white
        setupTab()
    }
}

private extension MainTabBarController {
    func setupTab() {
        
        var tempViewControllers: [UIViewController] = []
        let firstViewController: DietViewController? = DietViewController()
                firstViewController?.tabBarItem = UITabBarItem(title: "First", image: UIImage(named: "tab-icon-sample"), tag: 1)
        let firstNavigationController = UINavigationController(rootViewController: firstViewController!)
                tempViewControllers.append(firstNavigationController)
        let secondViewController: DietViewController? = DietViewController()
        secondViewController?.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarItem.SystemItem.downloads, tag: 2)
        let secondNavigationController = UINavigationController(rootViewController: secondViewController!)
                tempViewControllers.append(secondNavigationController)
        let thirdViewController: AnalsysViewController? = AnalsysViewController()
        thirdViewController?.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarItem.SystemItem.history, tag: 3)
        let thirdNavigationController = UINavigationController(rootViewController: thirdViewController!)
                tempViewControllers.append(thirdNavigationController)
        /*
        let firstViewController = DietViewController()
        firstViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .history, tag: 0)
        let secondViewController = AnalsysViewController()
        secondViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .downloads, tag: 0)*/
        self.setViewControllers(tempViewControllers, animated: true)
         
    }
}
