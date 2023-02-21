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
        
        // Create Tab For
        let tabFor = ViewControllerHome()
        let tabForBarItem4 = UITabBarItem(title: "Tab 4", image: UIImage(systemName: "trash.circle"), selectedImage: UIImage(systemName: "trash.circle.fill"))
        
        tabFor.tabBarItem = tabForBarItem4
        
        tabBar.backgroundColor =  UIColor(red: 0, green: 0, blue: 0.300, alpha: 0.8)
        tabBar.layer.cornerRadius = 20
        self.viewControllers = [tabOne, tabTwo, tabThree, tabFor]
    }
    
    // UITabBarControllerDelegate method
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("Selected \(viewController.title!)")
    }
}
