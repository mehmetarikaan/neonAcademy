//
//  SceneDelegate.swift
//  FirestoreChallange
//
//  Created by Mehmet Arıkan on 23.02.2023.
//

import UIKit
import FirebaseAuth
import Firebase

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let scene = (scene as? UIWindowScene) else { return }
        window? = UIWindow(windowScene: scene)
        window?.rootViewController = MainTabController()
        window?.makeKeyAndVisible()
        
        //self.setupWindow(with: scene)
        //self.checkAuthentication()
    }
    
//    private func setupWindow(with scene: UIScene) {
//        guard let windowScene = (scene as? UIWindowScene) else { return }
//        let window = UIWindow(windowScene: windowScene)
//        self.window = window
//        self.window?.makeKeyAndVisible()
//    }
    
//    public func checkAuthentication() {
//        if Auth.auth().currentUser == nil {
//            self.goToController(with: LoginViewController())
//        } else {
//            self.goToController(with: MainTabController())
//        }
//    }
    
    private func goToController(with viewController: UIViewController) {
        DispatchQueue.main.async { [weak self] in
            UIView.animate(withDuration: 0.25) {
                self?.window?.layer.opacity = 0
            } completion: { [weak self] _ in
                let nav = UINavigationController(rootViewController: viewController)
                nav.modalPresentationStyle = .fullScreen
                self?.window?.rootViewController = nav
                
                UIView.animate(withDuration: 0.25) { [weak self] in
                    self?.window?.layer.opacity = 1
                }
            }
        }
    }
}


