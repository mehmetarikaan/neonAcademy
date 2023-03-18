//
//  CustomCell.swift
//  BabyTracker
//
//  Created by Mehmet Arıkan on 18.03.2023.
//

import UIKit

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
        label.textColor = .black
        label.font = .systemFont(ofSize: 20, weight: .medium)
        label.textAlignment = .left
        return label
    }()
    
    private let statusIcon: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.tintColor = .label
        return image
    }()
    private let statusTitle: UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0.29512766, green: 0.1368008852, blue: 0.7957670093, alpha: 1)
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textAlignment = .left
        return label
    }()
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textAlignment = .left
        return label
    }()

}
