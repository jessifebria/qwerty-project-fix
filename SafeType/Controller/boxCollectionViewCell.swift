//
//  boxCollectionViewCell.swift
//  Qwerty
//
//  Created by Nathanael DJ on 12/04/21.
//

import UIKit

class boxCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var platformLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var entryLabel: UILabel!
    @IBOutlet weak var profaniteLabel: UILabel!
    
    var riwayatHariIni: History? {
        didSet {
            self.updateUI ()
        }
    }
    
    func updateUI() {
      
        if let riwayatHariIni = riwayatHariIni {
            platformLabel.text = riwayatHariIni.platform?.uppercased()
            if let jam = riwayatHariIni.waktu{
                dateLabel.text = Converter.convertDateToStringHourMinute(date: jam)
            }

            entryLabel.text = riwayatHariIni.kalimat
            
            let kataKotor = riwayatHariIni.kataKotor
            
            let start = kataKotor!.index(kataKotor!.startIndex, offsetBy: 2)
            let end = kataKotor!.index(kataKotor!.endIndex, offsetBy: -1)
            let range = start..<end

            let mySubstring = kataKotor![range]
            
            profaniteLabel.text = String(mySubstring)
            profaniteLabel.font = UIFont.boldSystemFont(ofSize: 14)
          
        } else {
            return
            //colorView.backgroundColor = nil
        }
       
    }
    
    override class func awakeFromNib() {
        
    }
    
}


