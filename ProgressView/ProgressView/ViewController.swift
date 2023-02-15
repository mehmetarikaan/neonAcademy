//
//  ViewController.swift
//  ProgressView
//
//  Created by Mehmet Arıkan on 15.02.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    lazy var myButton: UIButton = {
        let button = UIButton()
        button.setTitle("Click me!", for: .normal)
        button.backgroundColor = .systemPink
        button.layer.cornerRadius = 20
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()
    lazy var progressView: UIProgressView = {
       let progress = UIProgressView()
        progress.progress = 0
        progress.backgroundColor = .black
        progress.progressTintColor = .systemBlue
        progress.progressViewStyle = .bar
        //progress.setProgress(0.0, animated: true)
        return progress
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray
        setupUI()
    }
    
    @objc func buttonPressed(_ sender: UIButton){
        progressView.progress += 0.1
        if progressView.progress == 1.0 {
            progressView.progress = 0
        }
    }
    
    func setupUI(){
        view.addSubview(myButton)
        view.addSubview(progressView)
        
        progressView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(200)
            make.left.equalToSuperview().offset(100)
            make.height.equalTo(50)
            make.width.equalTo(200)
        }
        myButton.snp.makeConstraints { make in
            make.bottom.equalTo(progressView).offset(200)
            make.left.equalToSuperview().offset(100)
            make.height.equalTo(50)
            make.width.equalTo(200)
        }

    }


}

