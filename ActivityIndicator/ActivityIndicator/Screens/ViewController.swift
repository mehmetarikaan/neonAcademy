//
//  ViewController.swift
//  ActivityIndicator
//
//  Created by Mehmet Arıkan on 14.02.2023.
//

// bir daha bak 

import UIKit
import SnapKit

class ViewController: UIViewController {
    var myTimer = Timer()
    var secondsToCount = 1
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
        activityView.center = self.view.center
        activityView.color = .red
        return activityView
    }()
    
    lazy var myButton: UIButton = {
        let button = UIButton()
        button.setTitle("Click me!", for: .normal)
        button.backgroundColor = .systemOrange
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()
    
    //    var myTimer: Timer = {
    //        let timer = Timer.scheduledTimer(timeInterval: 1.0, target: ViewController.self, selector: #selector(fireTimer), userInfo: nil, repeats: true)
    //        return timer
    //    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    @objc func fireTimer(_ sender: Timer){
        print("hi")
    }
    
    @objc func buttonPressed(_ sender: UIButton){
        myTimer.invalidate()
        myTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
    }
    @objc func updateTimer() {
        secondsToCount += 1
        if secondsToCount % 10 == 0 {
            myIndicator.color = .blue
        } else {
           labelTitle.text = String(secondsToCount)
        }
    }
    
    func setupUI(){
        view.addSubview(labelTitle)
        view.addSubview(myIndicator)
        view.addSubview(myButton)
        
        myIndicator.startAnimating()
        
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
}

