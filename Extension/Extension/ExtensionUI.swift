//
//  ExtensionUI.swift
//  Extension
//
//  Created by Mehmet Arıkan on 3.02.2023.
//

import Foundation
import UIKit

extension UIViewController {
    func changeBackgroundColor(color: UIColor){
        view.backgroundColor = color
    }
}

extension UILabel {
    func changeText(text: String){
        self.text = text
    }
}

//Crash

//extension UIImage {
//    func setImage(image: UIImage?) {
//        self.image = image
//    }
//}

extension UIImageView {
    func changeImageView(image: UIImage?){
        self.image = image
    }
}

extension UIButton{
    func changeButton(backgroundColor: UIColor){
        self.backgroundColor = backgroundColor
    }
}
