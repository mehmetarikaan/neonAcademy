//
//  StartViewController.swift
//  HeroChallange
//
//  Created by Mehmet Arıkan on 21.02.2023.
//

import UIKit

class StartViewController: UIViewController {
    
    lazy var labelTitle: UILabel = {
        var label = UILabel()
        label.text = "Welcome to the maze. If you succeed, you are ready for the real world."
        label.textColor = .systemCyan
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    lazy var startButton: UIButton = {
       var button = UIButton()
        button.setTitle("Start, next!", for: .normal)
        button.backgroundColor = .systemCyan
        button.layer.cornerRadius = 20
        button.addTarget(self, action: #selector(playGame), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupStartUI()
    }
    
    @objc func playGame(){
        self.navigationController?.pushViewController(ViewController(), animated: true)
    }
    
    func setupStartUI(){
        view.addSubview(labelTitle)
        
        labelTitle.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(250)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
        }
        
        view.addSubview(startButton)
        
        startButton.snp.makeConstraints { make in
            make.top.equalTo(labelTitle.snp.bottom).offset(200)
            make.leading.equalToSuperview().offset(60)
            make.trailing.equalToSuperview().inset(60)
        }
        
    }
}
