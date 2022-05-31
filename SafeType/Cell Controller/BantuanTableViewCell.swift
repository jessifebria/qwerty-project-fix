//
//  BantuanTableViewCell.swift
//  SafeType
//
//  Created by Yafonia Hutabarat on 18/10/21.
//

import UIKit

class BantuanTableViewCell: UITableViewCell {
    
    let questionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.numberOfLines = 3
        return label
    }()
    
    let downChevronButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        button.frame.size = CGSize(width: 20.0, height: 20.0)
        return button
    }()
    
    var bantuan: Bantuan? {
        didSet {
            self.updateUI()
        }
    }

    private func updateUI() {
        self.contentView.addSubview(questionLabel)
        self.contentView.addSubview(downChevronButton)
        
        let downChevronButtonConstraints = [
            downChevronButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            downChevronButton.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20)
        ]
        NSLayoutConstraint.activate(downChevronButtonConstraints)

        questionLabel.text = bantuan?.question
        
        let questionLabelConstraints = [
            questionLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            questionLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            questionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            questionLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            questionLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -80)
        ]
        
        NSLayoutConstraint.activate(questionLabelConstraints)
    }
}
