//
//  ViewControllerTwo.swift
//  NotificationCenter
//
//  Created by Mehmet Arıkan on 6.02.2023.
//

import UIKit

class ViewControllerTwo: UIViewController {

    private lazy var codeWordContainerView: UIView = {
        return InputContainerView(textField: codeWordTextField)
    }()
    private let codeWordTextField = CustomTextField(placeholder: "Set Password")
    private lazy var passwordButton: CustomButton = {
        let button = CustomButton(type: .system)
        button.setTitle("Show Password", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.addTarget(self, action: #selector(showCodeWord), for: .touchUpInside)
        return button
    }()

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    //MARK: - Helpers
    func configureUI() {
        view.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        view.addSubview(codeWordContainerView)
        codeWordContainerView.anchor(top: view.topAnchor, left: view.leftAnchor, right: view.rightAnchor,
                        paddingTop: 200, paddingLeft: 60, paddingRight: 60)
        
        
        view.addSubview(passwordButton)
        passwordButton.centerX(inView: codeWordContainerView)
        passwordButton.anchor(top: codeWordContainerView.bottomAnchor, paddingTop: 70)
    }
    //MARK: - Selector
    @objc func showCodeWord(_ sender: UIButton) {
        NotificationCenter.default.post(name: .notificationA, object: nil)
        navigationController?.popViewController(animated: true)
    }
}
