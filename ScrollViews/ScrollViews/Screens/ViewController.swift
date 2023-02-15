//
//  ViewController.swift
//  ScrollViews
//
//  Created by Mehmet Arıkan on 15.02.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    lazy var labelOne: UILabel = {
        let label = UILabel()
        label.text = "Mehmet"
        label.font = .systemFont(ofSize: 40)
        label.textColor = .systemBlue
        label.textAlignment = .center
        return label
    }()
    lazy var labelTwo: UILabel = {
        let label = UILabel()
        label.text = "Mehmet"
        label.font = .systemFont(ofSize: 40)
        label.textColor = .systemRed
        label.textAlignment = .center
        return label
    }()
    lazy var labelThree: UILabel = {
        let label = UILabel()
        label.text = "Mehmet"
        label.font = .systemFont(ofSize: 40)
        label.textColor = .systemGreen
        label.textAlignment = .center
        return label
    }()
    lazy var labelFor: UILabel = {
        let label = UILabel()
        label.text = "Mehmet"
        label.font = .systemFont(ofSize: 40)
        label.textColor = .systemOrange
        label.textAlignment = .center
        return label
    }()
    lazy var labelFive: UILabel = {
        let label = UILabel()
        label.text = "Mehmet"
        label.font = .systemFont(ofSize: 40)
        label.textColor = .systemBrown
        label.textAlignment = .center
        return label
    }()
    lazy var labelSix: UILabel = {
        let label = UILabel()
        label.text = "Mehmet"
        label.font = .systemFont(ofSize: 40)
        label.textColor = .systemTeal
        label.textAlignment = .center
        return label
    }()
    lazy var labelSeven: UILabel = {
        let label = UILabel()
        label.text = "Mehmet"
        label.font = .systemFont(ofSize: 40)
        label.textColor = .systemPink
        label.textAlignment = .center
        return label
    }()
    lazy var labelEight: UILabel = {
        let label = UILabel()
        label.text = "Mehmet"
        label.font = .systemFont(ofSize: 40)
        label.textColor = .systemPurple
        label.textAlignment = .center
        return label
    }()
    lazy var labelLast:  UILabel = {
        let label = UILabel()
        label.text = "You have reached the end of the scroll view."
        label.font = .systemFont(ofSize: 15)
        label.textColor = .systemGray3
        label.textAlignment = .left
        return label
    }()
    lazy var scrollView: UIScrollView = {
       let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .systemCyan
        return scrollView
    }()
    lazy var containersView: UIStackView = {
        let container = UIStackView(arrangedSubviews: [labelOne, labelTwo, labelThree, labelFor, labelFive, labelSix, labelSeven, labelEight, labelLast])
        container.axis = .vertical
        container.spacing = 160
        container.alignment = .center
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI(){
       
        view.addSubview(scrollView)
        scrollView.addSubview(containersView)
        
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top)
            make.leading.equalTo(view.snp.leading)
            make.trailing.equalTo(view.snp.trailing)
            make.bottom.equalTo(view.snp.bottom)
        }
        
        containersView.snp.makeConstraints { make in
            make.top.equalTo(scrollView.snp.top).offset(48)
            make.leading.equalTo(scrollView.snp.leading).offset(32)
            make.trailing.equalTo(scrollView.snp.trailing).inset(32)
            make.bottom.equalTo(scrollView.snp.bottom).inset(32)
        }
    }
}


