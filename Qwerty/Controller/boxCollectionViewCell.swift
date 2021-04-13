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
            platformLabel.text = riwayatHariIni.platform
            if let jam = riwayatHariIni.waktu{
                dateLabel.text = Converter.convertDateToStringHourMinute(date: jam)
            }

            entryLabel.text = riwayatHariIni.kalimat
            profaniteLabel.text = riwayatHariIni.kataKotor
            //colorView.backgroundColor = course.color
        } else {
            return
            //colorView.backgroundColor = nil
        }
       
    }
    
    override class func awakeFromNib() {
        
    }
    
}


