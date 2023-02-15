//
//  ViewController.swift
//  StackViewChallange
//
//  Created by Mehmet Arıkan on 15.02.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    lazy var labelOne: UILabel = {
        let label = UILabel()
        label.text = "Mehmet"
        label.font = .systemFont(ofSize: 30)
        label.textColor = .systemBlue
        return label
    }()
    lazy var labelTwo: UILabel = {
        let label = UILabel()
        label.text = "Mehmet"
        label.font = .systemFont(ofSize: 30)
        label.textColor = .systemRed
        return label
    }()
    lazy var labelThree: UILabel = {
        let label = UILabel()
        label.text = "Mehmet"
        label.font = .systemFont(ofSize: 30)
        label.textColor = .systemGreen
        return label
    }()
    lazy var labelFor: UILabel = {
        let label = UILabel()
        label.text = "Mehmet"
        label.font = .systemFont(ofSize: 30)
        label.textColor = .systemOrange
        return label
    }()
    lazy var labelFive: UILabel = {
        let label = UILabel()
        label.text = "Mehmet"
        label.font = .systemFont(ofSize: 30)
        label.textColor = .systemBrown
        return label
    }()
    lazy var labelSix: UILabel = {
        let label = UILabel()
        label.text = "Mehmet"
        label.font = .systemFont(ofSize: 30)
        label.textColor = .systemTeal
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
     configureStack()
    }
    
    func configureStack(){
        let stack = UIStackView(arrangedSubviews: [labelOne, labelTwo, labelThree, labelFor, labelFive,labelSix])
        view.addSubview(stack)
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.alignment = .center
        stack.spacing = 1
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.leading.equalToSuperview().offset(32)
            make.trailing.equalToSuperview().inset(32)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(30)
        }
    }
}

