//
//  SettingsTableViewCell.swift
//  SafeType
//
//  Created by Yafonia Hutabarat on 16/09/21.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {

    @IBOutlet weak var itemLabel: UILabel!
    @IBOutlet weak var imageIcon: UIImageView!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var iconView: UIView!
    
    var settingsItem: SettingsItem? {
        didSet {
            self.updateUI()
        }
    }
    
    func updateUI() {
        itemLabel.text = settingsItem?.rawValue
        detailLabel.text = settingsItem?.detail()
        guard let imageName = settingsItem?.imageName() else {return}
        imageIcon.image = UIImage(systemName: imageName)
        iconView.layer.borderColor = #colorLiteral(red: 0.7921568627, green: 0.7921568627, blue: 0.7921568627, alpha: 1)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
