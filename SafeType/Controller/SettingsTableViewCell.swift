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
    
    var settingsItem: SettingsItem? {
        didSet {
            self.updateUI()
        }
    }
    
    func updateUI() {
        itemLabel.text = settingsItem?.name
        detailLabel.text = settingsItem?.detail
        guard let imageName = settingsItem?.image else {return}
        imageIcon.image = UIImage(systemName: imageName)
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
