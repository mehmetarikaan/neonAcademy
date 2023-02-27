//
//  Extension.swift
//  FirestoreChallange
//
//  Created by Mehmet Arıkan on 27.02.2023.
//

import UIKit
import JGProgressHUD

extension UIView {
    func setGradientBackground() {
        let colorTop =  UIColor(#colorLiteral(red: 0.9607843137, green: 0.8862745098, blue: 0.0862745098, alpha: 1)).cgColor
        let colorBottom = UIColor(#colorLiteral(red: 0.2196078431, green: 0.737254902, blue: 0.1098039216, alpha: 1)).cgColor
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.bounds
        self.layer.insertSublayer(gradientLayer, at:0)
    }
}

extension UIViewController {
    static let hud = JGProgressHUD(style: .dark)
    func showLoader(_ show: Bool) {
        view.endEditing(true)
        
        if show {
            UIViewController.hud.show(in: view)
        } else {
            UIViewController.hud.dismiss()
        }
    }
}
