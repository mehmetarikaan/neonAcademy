//
//  ViewController.swift
//  TabBar
//
//  Created by Mehmet Arıkan on 15.02.2023.
//

import UIKit
class ViewController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Assign self for delegate for that ViewController can respond to UITabBarControllerDelegate methods
        self.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create Tab one
        let tabOne = ViewControllerManager()
        let tabOneBarItem = UITabBarItem(title: "Tab 1", image: UIImage(systemName: "person.circle"), selectedImage: UIImage(systemName: "person.circle.fill"))
        
        tabOne.tabBarItem = tabOneBarItem
        
        
        // Create Tab two
        let tabTwo = ViewControllerEdit()
        let tabTwoBarItem2 = UITabBarItem(title: "Tab 2", image: UIImage(systemName: "message.circle"), selectedImage: UIImage(systemName: "message.circle.fill"))
        
        tabTwo.tabBarItem = tabTwoBarItem2
        
        // Create Tab three
        let tabThree = ViewControllerHome()
        let tabTwoBarItem3 = UITabBarItem(title: "Tab 3", image: UIImage(systemName: "trash.circle"), selectedImage: UIImage(systemName: "trash.circle.fill"))
        
        tabThree.tabBarItem = tabTwoBarItem3
        
        
        self.viewControllers = [tabOne, tabTwo, tabThree]
    }
    
    // UITabBarControllerDelegate method
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("Selected \(viewController.title!)")
    }
}
