//
//  TableViewCell.swift
//  SearchBarChallange
//
//  Created by Mehmet Arıkan on 17.02.2023.
//

import UIKit
import SnapKit

final class TableViewCell: UITableViewCell {
    let fullNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir-Heavy", size: 24)
        label.text = "Mehmet"
        label.textColor = #colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configureUI() {
        addSubview(fullNameLabel)
        fullNameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(14)
            make.leading.equalTo(20)
        }
    }
}
