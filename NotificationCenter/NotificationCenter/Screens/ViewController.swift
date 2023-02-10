//
//  ViewControllerTwo.swift
//  NotificationCenter
//
//  Created by Mehmet Arıkan on 6.02.2023.
//

import UIKit

class ViewController: UIViewController {
    //MARK: - Properties
    var codeWord: UILabel = {
        let label = UILabel()
        label.text = "THIS IS PASSWORD 'MEHMET ARIKAN'"
        label.numberOfLines = 2
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        return label
    }()
    
    
    private lazy var goToLockButton: CustomButton = {
        let button = CustomButton(type: .system)
        button.setTitle("Enter Password", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.addTarget(self, action: #selector(showLockPage), for: .touchUpInside)
        return button
    }()

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
        let notificationCenter: NotificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(self.showCodeWord), name: .notificationA, object: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        createrTimer()
    }
    
    //MARK: - Helpers
    func configureUI() {
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        view.addSubview(codeWord)
        codeWord.anchor(top: view.topAnchor, left: view.leftAnchor, right: view.rightAnchor,
                        paddingTop: 160, paddingLeft: 80, paddingRight: 80)
        
        view.addSubview(goToLockButton)
        goToLockButton.centerX(inView: codeWord)
        goToLockButton.anchor(top: codeWord.bottomAnchor, paddingTop: 160)
        
    }
    func createrTimer() {
        let timer = Timer.scheduledTimer(timeInterval: 10, target: self,
                                         selector: #selector(messageRemove),
                                         userInfo: nil, repeats: false)
        DispatchQueue.main.asyncAfter(deadline: .now()+16) {
            timer.fire()
        }
    }
    

    //MARK: - Selector
    @objc func showCodeWord(_ sender: UIButton) {
        self.view.backgroundColor =  #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    @objc func showLockPage(_ sender: UIButton) {
        let controller = ViewControllerTwo()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc func messageRemove() {
        codeWord.text?.removeAll()
    }

}

