//
//  TableViewCell.swift
//  TableViewChallange
//
//  Created by Mehmet Arıkan on 17.02.2023.
//

import UIKit
import SnapKit

final class TableViewCell: UITableViewCell {
    //MARK: - Properties
    let fullnameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir-Heavy", size: 20)
        label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        return label
    }()
    let agesLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir", size: 20)
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return label
    }()
    let homeTownLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir-Heavy", size: 20)
        label.textColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)
        return label
    }()
    let emailLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir-Light", size: 20)
        label.textColor = #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)
        return label
    }()
    //MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - Helpers
    func configureUI() {
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        addSubview(fullnameLabel)
        fullnameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(14)
            make.leading.equalTo(20)
        }
        
        addSubview(agesLabel)
        agesLabel.snp.makeConstraints { make in
            make.leading.equalTo(fullnameLabel.snp.trailing).offset(10)
            make.top.equalToSuperview().offset(14)
        }
        
        addSubview(homeTownLabel)
        homeTownLabel.snp.makeConstraints { make in
            make.top.equalTo(fullnameLabel.snp.bottom).offset(8)
            make.leading.equalToSuperview().inset(20)
        }
        
        addSubview(emailLabel)
        emailLabel.snp.makeConstraints { make in
            make.top.equalTo(homeTownLabel.snp.bottom).offset(8)
            make.leading.equalToSuperview().inset(20)
        }
    }
}
