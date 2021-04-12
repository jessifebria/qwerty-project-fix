//
//  FilterTableViewCell.swift
//  Qwerty
//
//  Created by Yafonia Hutabarat on 11/04/21.
//

import UIKit

class FilterTableViewCell: UITableViewCell {
    
    var title: String?
    @IBOutlet weak var filterLabel: UILabel!
    @IBOutlet weak var checkmarkImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        filterLabel.text = title

        // Configure the view for the selected state
    }

}
