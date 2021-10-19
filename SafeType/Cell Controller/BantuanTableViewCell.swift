//
//  BantuanTableViewCell.swift
//  SafeType
//
//  Created by Yafonia Hutabarat on 18/10/21.
//

import UIKit

class BantuanTableViewCell: UITableViewCell {
    
    var bantuan: Bantuan? {
        didSet {
            self.updateUI()
        }
    }
    private func updateUI() {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        label.center = CGPoint(x: 160, y: 285)
        label.textAlignment = .center
        label.text = bantuan?.question
        self.addSubview(label)
    }
//    
//    var bantuan: Bantuan? {
//        didSet {
//            kataKotor.text = kata?.kata
//        }
//    }
//
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
//
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
