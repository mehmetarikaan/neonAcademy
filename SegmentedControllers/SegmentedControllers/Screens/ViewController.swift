//
//  ViewController.swift
//  SegmentedControllers
//
//  Created by Mehmet Arıkan on 14.02.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    lazy var segmentControll: UISegmentedControl = {
        let segment = UISegmentedControl(items: ["Neon Academy 2023", "Neon", "Apps"])
        segment.backgroundColor = .systemCyan
        segment.tintColor = .white
        segment.selectedSegmentIndex = 0
        segment.addTarget(self, action: #selector(segmentAction(_:)), for: .valueChanged)
        view.backgroundColor = .systemPink
        return segment
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI(){
        view.addSubview(segmentControll)
        
        segmentControll.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(40)
            make.height.equalTo(100)
            make.width.equalToSuperview()
            make.centerY.equalTo(0)
            make.centerX.equalTo(view)
        }
        
    }
    
    @objc func segmentAction(_ sender: UISegmentedControl){
        switch sender.selectedSegmentIndex {
        case 0:
            segmentControll.snp.makeConstraints { make in
                make.height.equalTo(100)
                make.width.equalToSuperview()
            }
            view.backgroundColor = .systemPink
        case 1:
            segmentControll.snp.makeConstraints { make in
                make.height.equalTo(80)
                make.width.equalToSuperview()
            }
            view.backgroundColor = .systemGreen
        case 2:
            segmentControll.snp.makeConstraints { make in
                make.height.equalTo(60)
                make.width.equalToSuperview()
            }
            view.backgroundColor = .systemRed
        default:
            segmentControll.snp.makeConstraints { make in
                make.height.equalTo(100)
                make.width.equalToSuperview()
            }
            view.backgroundColor = .systemRed
        }
    }
    
    
}

