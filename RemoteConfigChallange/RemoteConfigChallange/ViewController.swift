//
//  ViewController.swift
//  RemoteConfigChallange
//
//  Created by Mehmet Arıkan on 28.02.2023.
//

import UIKit
import FirebaseRemoteConfig
import SnapKit
import FirebaseDynamicLinks

class ViewController: UIViewController {
    
    private let remoteConfig = RemoteConfig.remoteConfig()
    
    lazy var titleLabel: UILabel = {
        var label = UILabel()
        label.text = "Mehmet Arıkan"
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.isHidden = true
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        fetchValues()
        
    }
    
    func fetchValues(){
        
        let defaults: [String: NSObject] = [
            "shows": false as NSObject
        ]
        remoteConfig.setDefaults(defaults)
        let settings = RemoteConfigSettings()
        settings.minimumFetchInterval = 0
        remoteConfig.configSettings = settings
        
        updateUI(newUI: false)
        
        self.remoteConfig.fetch(withExpirationDuration: 0) { status, error in
            if status == .success, error == nil {
                self.remoteConfig.activate { _, error in
                    guard error == nil else {
                        return
                    }
                    let value = self.remoteConfig.configValue(forKey: "shows").boolValue
                    print("Fetched Value \(value)")
                    DispatchQueue.main.async {
                        self.updateUI(newUI: value)
                    }
                }
            } else {
                print("Bir şeyler ters gitti kanka")
            }
        }
        
    }
    
    func updateUI(newUI: Bool) {
        if newUI {
            titleLabel.isHidden = false
        } else {
            titleLabel.isHidden = true
        }
    }
    
    func setupUI(){
        view.backgroundColor = .white
        view.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
        }
    }
    

}

