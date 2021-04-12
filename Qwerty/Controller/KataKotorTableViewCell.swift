//
//  KataKotorTableViewCell.swift
//  Qwerty
//
//  Created by Jonathan Herbert on 09/04/21.
//

import UIKit

class KataKotorTableViewCell: UITableViewCell {

    @IBOutlet weak var kataKotor: UILabel!
    
    var kata: KataKotor? {
        didSet {
            kataKotor.text = kata?.kata
        }
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
