//
//  HomeViewController.swift
//  FirebaseAuthenticationChallange
//
//  Created by Mehmet Arıkan on 22.02.2023.
//

import UIKit
import Firebase
import FirebaseAuth

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        do {
            try Auth.auth().signOut()
        } catch {
            print("sea")
        }

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
