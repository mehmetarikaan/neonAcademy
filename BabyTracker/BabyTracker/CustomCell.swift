//
//  CustomCell.swift
//  BabyTracker
//
//  Created by Mehmet Arıkan on 18.03.2023.
//

import UIKit
import SnapKit

class CustomCell: UITableViewCell {

    static let identifier = "CustomCell"
    
    private let calenderIcon: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "img_icon_calender")
        image.contentMode = .scaleAspectFit
        image.tintColor = .label
        return image
    }()
    private let lineImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "img_line")
        image.contentMode = .scaleAspectFit
        image.tintColor = .blue
        return image
    }()
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Tue, 12 Feb"
        label.textColor = .black
        label.font = .systemFont(ofSize: 20, weight: .medium)
        label.textAlignment = .left
        return label
    }()
    
    private let statusIcon: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: "img_selected_feeding")
        image.tintColor = .label
        return image
    }()
    private var statusTitle: UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0.29512766, green: 0.1368008852, blue: 0.7957670093, alpha: 1)
        label.text = "Feeding"
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textAlignment = .left
        return label
    }()
    private var timeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "12:30 AM"
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textAlignment = .left
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupCellUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(statusTit: String, timeLab: String, statusIcon: String){
        self.statusTitle.text = statusTit
        self.timeLabel.text = timeLab
        self.statusIcon.image = UIImage(named: "\(statusIcon)")
    }
    
    private func setupCellUI(){
        contentView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        let conteiner = UIView()
        conteiner.backgroundColor = #colorLiteral(red: 0.9529412389, green: 0.9529412389, blue: 0.9529412389, alpha: 1)
        conteiner.layer.cornerRadius = 25
        self.contentView.addSubview(conteiner)
        
        conteiner.snp.makeConstraints { make in
            make.height.equalToSuperview().multipliedBy(0.88)
            make.width.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        self.contentView.addSubview(calenderIcon)
        self.contentView.addSubview(lineImage)
        self.contentView.addSubview(titleLabel)
        self.contentView.addSubview(statusIcon)
        self.contentView.addSubview(statusTitle)
        self.contentView.addSubview(timeLabel)
        
        calenderIcon.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(14)
            make.left.equalTo(28)
            make.bottom.equalTo(lineImage.snp.top).offset(16)
        }
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(14)
            make.left.equalTo(calenderIcon.snp.right).offset(11)
            make.bottom.equalTo(lineImage.snp.top).offset(16)
        }
        lineImage.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        statusIcon.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(72)
            make.left.equalTo(23)
        }
        statusTitle.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(72)
            make.left.equalTo(statusIcon.snp.right).offset(8)
        }
        timeLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(72)
            make.right.equalTo(-23)
        }
    }
}
