//
//  ViewController.swift
//  UserDefaultsCase
//
//  Created by Mehmet Arıkan on 3.02.2023.
//

//MARK: - Eksik, tamamlanacak. 

import UIKit

class ViewController: UIViewController {
    
    let myTextField: UITextField = UITextField(frame: CGRect(x: 0, y: 0, width: 350.00, height: 40.00))

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
        // Label
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
          label.center = CGPoint(x: 160, y: 285)
          label.textAlignment = .center
        label.text = UserDefaults.standard.string(forKey: "city")

          self.view.addSubview(label)
        
        
            self.view.addSubview(myTextField)
        
        myTextField.center = self.view.center
        myTextField.placeholder = "Name of the place?"
        myTextField.borderStyle = UITextField.BorderStyle.roundedRect
        myTextField.backgroundColor = UIColor.white
        myTextField.textColor = UIColor.black
        self.view.addSubview(myTextField)
        
        // Button
        
        let button = UIButton(type: UIButton.ButtonType.system) as UIButton
               
               let xPostion:CGFloat = 110
               let yPostion:CGFloat = 380
               let buttonWidth:CGFloat = 150
               let buttonHeight:CGFloat = 45
               
               button.frame = CGRect(x:xPostion, y:yPostion, width:buttonWidth, height:buttonHeight)
               
               button.backgroundColor = UIColor.black
               button.setTitle("Save", for: UIControl.State.normal)
               button.tintColor = UIColor.white
               button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
               
               self.view.addSubview(button)
        
             
    }
    

    @objc func buttonAction()
    {
        
        UserDefaults.standard.set(myTextField.text, forKey: "city") //setObject
    }
    
    
}

