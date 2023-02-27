//
//  ViewController.swift
//  ChallangeSnapkitMeet
//
//  Created by Mehmet Arıkan on 23.02.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    lazy var createdButton: UIButton = {
        var button = UIButton()
        button.setTitle("Animated", for: .normal)
        button.backgroundColor = .systemPurple
        button.tintColor = .white
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(animatePressed), for: .touchUpInside)
        return button
    }()
    
    lazy var viewPageOne: UIView = {
        var view = UIView()
        view.backgroundColor = .red
        return view
    }()
    lazy var viewPageTwo: UIView = {
        var view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    lazy var viewPageThree: UIView = {
        var view = UIView()
        view.backgroundColor = .yellow
        return view
    }()
    lazy var viewPageFor: UIView = {
        var view = UIView()
        view.backgroundColor = .green
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        
    }
    
    @objc func animatePressed(){
        UIView.animate(withDuration: 5){
            self.viewPageOne.snp.updateConstraints { make in
                make.top.equalToSuperview().offset(70)
                make.leading.equalToSuperview().offset(5)
                make.trailing.equalToSuperview().inset(50)
                make.height.equalTo(30)
            }
            self.view.layoutIfNeeded()
        }
        UIView.animate(withDuration: 8){
            self.viewPageTwo.snp.updateConstraints { make in
                make.top.equalTo(self.viewPageOne.snp.bottom).offset(100)
                make.leading.equalToSuperview().offset(50)
                make.trailing.equalToSuperview().inset(50)
                make.height.equalTo(120)
            }
            self.view.layoutIfNeeded()
        }
        
        UIView.animate(withDuration: 3){
            self.viewPageThree.snp.updateConstraints { make in
                make.top.equalTo(self.viewPageTwo.snp.bottom).offset(230)
                make.trailing.equalToSuperview().inset(20)
                make.height.equalTo(120)
            }
            self.view.layoutIfNeeded()
        }
        UIView.animate(withDuration: 9){
            self.viewPageFor.snp.updateConstraints { make in
                make.top.equalTo(self.viewPageThree.snp.bottom).offset(50)
                make.trailing.equalToSuperview().inset(20)
                make.height.equalTo(20)
            }
            self.view.layoutIfNeeded()
        }
    }
    func setupUI(){

        view.addSubview(viewPageOne)
        view.addSubview(viewPageTwo)
        view.addSubview(viewPageThree)
        view.addSubview(viewPageFor)
        view.addSubview(createdButton)
        
        viewPageOne.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(70)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().inset(30)
            make.height.equalTo(100)
        }
        viewPageTwo.snp.makeConstraints { make in
            make.top.equalTo(viewPageOne.snp.bottom).offset(70)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().inset(30)
            make.height.equalTo(100)
        }
        viewPageThree.snp.makeConstraints { make in
            make.top.equalTo(viewPageTwo.snp.bottom).offset(70)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().inset(30)
            make.height.equalTo(100)
        }
        viewPageFor.snp.makeConstraints { make in
            make.top.equalTo(viewPageThree.snp.bottom).offset(70)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().inset(30)
            make.height.equalTo(100)
        }
        createdButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(100)
            make.leading.equalToSuperview().offset(50)
            make.trailing.equalToSuperview().inset(50)
            make.height.equalTo(50)
        }
    }


}

