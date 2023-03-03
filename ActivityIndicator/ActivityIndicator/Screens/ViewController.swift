//
//  ViewController.swift
//  ActivityIndicator
//
//  Created by Mehmet Arıkan on 14.02.2023.
//

// bir daha bak

// bir daha bakıldı

import UIKit
import SnapKit

class ViewController: UIViewController {
    //MARK: - Properties
    var isValid = false
    var count = 0
    var timer : Timer?
    var colors = [UIColor.systemTeal, UIColor.systemYellow, UIColor.systemBlue, UIColor.systemPink, UIColor.systemGray, UIColor.systemMint, UIColor.systemFill]
    private var elapsedTime: TimeInterval?
    
    lazy var labelTitle: UILabel = {
        var label = UILabel()
        label.text = "0"
        label.textColor = .systemBlue
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 50)
        return label
    }()
    
    lazy var myIndicator: UIActivityIndicatorView = {
        let activityView = UIActivityIndicatorView(style: .large)
        return activityView
    }()
    
    lazy var myButton: UIButton = {
        let button = UIButton()
        button.setTitle("Click me!", for: .normal)
        button.backgroundColor = .systemOrange
        button.addTarget(self, action: #selector(counter), for: .touchUpInside)
        return button
    }()
    
    //MARK: - Lifeycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    //MARK: - UI Create
    func setupUI(){
        view.addSubview(labelTitle)
        view.addSubview(myIndicator)
        view.addSubview(myButton)
        
        myIndicator.translatesAutoresizingMaskIntoConstraints = false
        myIndicator.isHidden = true
        myIndicator.color = .red
        myIndicator.hidesWhenStopped = true
        
        myIndicator.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.left.equalToSuperview().offset(100)
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
        
        labelTitle.snp.makeConstraints { make in
            make.bottom.equalTo(myIndicator).offset(100)
            make.left.equalToSuperview().offset(100)
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
        
        myButton.snp.makeConstraints { make in
            make.bottom.equalTo(labelTitle).offset(100)
            make.left.equalToSuperview().offset(100)
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
    }
    
    //MARK: - Actions
    
    @objc func counter() {
        
        if !self.isValid {
            myIndicator.startAnimating()
            myButton.setTitle("Stop", for: .normal)
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)
            self.isValid = true
        } else {
            myButton.setTitle("Start", for: .normal)
            myIndicator.stopAnimating()
            timer?.invalidate()
            self.isValid = false
        }
    }
    
    @objc func fireTimer() {
        if timer!.isValid {
            labelTitle.text = String(count + 1)
            count += 1
            
        } else {
            labelTitle.text = String(count)
            timer?.invalidate()
            
        }
        if count % 10 == 0 {
            myIndicator.color = colors[Int.random(in: 0...colors.count - 1)]
        }
        if count == 100 {
            myIndicator.stopAnimating()
            timer?.invalidate()
            count = 0
        }
    }
    
}


