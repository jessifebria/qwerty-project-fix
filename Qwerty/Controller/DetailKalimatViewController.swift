//
//  DetailKalimatViewController.swift
//  Qwerty
//
//  Created by Jonathan Herbert on 08/04/21.
//

import UIKit

class DetailKalimatViewController: UIViewController {

    @IBOutlet weak var detailKalimat: UILabel!
    @IBOutlet weak var kataTerdeteksi: UILabel!
    @IBOutlet weak var jumlahKataTerdeteksi: UILabel!
    @IBOutlet weak var platformTerdeteksi: UILabel!
    @IBOutlet weak var hariTanggalTerdeteksi: UILabel!
    @IBOutlet weak var jamTerdeteksi: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailKalimat.sizeToFit()
        detailKalimat.numberOfLines = 0
        kataTerdeteksi.sizeToFit()
        kataTerdeteksi.numberOfLines = 0
        jumlahKataTerdeteksi.sizeToFit()
        jumlahKataTerdeteksi.numberOfLines = 0
        platformTerdeteksi.sizeToFit()
        platformTerdeteksi.numberOfLines = 0
        hariTanggalTerdeteksi.sizeToFit()
        hariTanggalTerdeteksi.numberOfLines = 0
        jamTerdeteksi.sizeToFit()
        jamTerdeteksi.numberOfLines = 0
        
        //yaf udh gua siapin ya itu label label nya yg buat diganti sama data nya, tinggal lu label.text = riwayat.blabla gtuu tengkiu
        
    }

}
