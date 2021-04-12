//
//  riwayatTableViewCell.swift
//  Qwerty
//
//  Created by Nathanael DJ on 12/04/21.
//

import UIKit

class ProgressKataUnikViewCell: UITableViewCell {
    @IBOutlet weak var kataKotorLabel: UILabel!
    @IBOutlet weak var progressRiwayat: UIProgressView!
    @IBOutlet weak var countRiwayat: UILabel!
    
    
    var jumlah: Int?
            
    override func awakeFromNib() {
        
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}


