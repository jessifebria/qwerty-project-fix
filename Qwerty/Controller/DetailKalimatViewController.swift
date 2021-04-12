//
//  DetailKalimatViewController.swift
//  Qwerty
//
//  Created by Jonathan Herbert on 08/04/21.
//

import UIKit

class DetailKalimatViewController: UIViewController, UIActionSheetDelegate {

  
    @IBOutlet weak var detailKalimat: UILabel!
    @IBOutlet weak var kataTerdeteksi: UILabel!
    @IBOutlet weak var jumlahKataTerdeteksi: UILabel!
    @IBOutlet weak var platformTerdeteksi: UILabel!
    @IBOutlet weak var hariTanggalTerdeteksi: UILabel!
    @IBOutlet weak var jamTerdeteksi: UILabel!
    
    var riwayat: History?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Detail Riwayat"
        
        let button: UIButton = UIButton(type: UIButton.ButtonType.custom)
        button.setImage(UIImage(named: "filter"), for: .normal)
        button.addTarget(self, action:#selector(deleteAction), for: UIControl.Event.touchUpInside)
        button.frame = CGRect(x: 0, y: 0, width: 10, height: 10)
        let barButton = UIBarButtonItem(customView: button)
        self.navigationItem.rightBarButtonItem = barButton
        
        detailKalimat?.sizeToFit()
        detailKalimat?.numberOfLines = 0
        kataTerdeteksi?.sizeToFit()
        kataTerdeteksi?.numberOfLines = 0
        jumlahKataTerdeteksi?.sizeToFit()
        jumlahKataTerdeteksi?.numberOfLines = 0
        platformTerdeteksi?.sizeToFit()
        platformTerdeteksi?.numberOfLines = 0
        hariTanggalTerdeteksi?.sizeToFit()
        hariTanggalTerdeteksi?.numberOfLines = 0
        jamTerdeteksi?.sizeToFit()
        jamTerdeteksi?.numberOfLines = 0
        
        guard let timestamp = riwayat?.waktu else { return }
        let jam = Converter.convertDateToStringHourMinute(date: timestamp)
        let hariTanggal = Converter.convertDateToLocaleDate(date: timestamp)
        
        let arrayKataKotor = Converter.replaceCommaToArray(kataKotor: riwayat!.kataKotor!)
        let stringKataKotor = Converter.addCommaFromArrayToString(kataKotor: arrayKataKotor)
        
        detailKalimat?.text = riwayat?.kalimat
        kataTerdeteksi?.text = stringKataKotor
        jamTerdeteksi?.text = jam
        platformTerdeteksi?.text = riwayat?.platform
        hariTanggalTerdeteksi?.text = hariTanggal
        jumlahKataTerdeteksi?.text = String(arrayKataKotor.count)
    }
    

    @IBAction func deleteAction (_ sender: UIButton) {
        print("tapped")
        let actionSheetControllerIOS8: UIAlertController = UIAlertController(title: nil, message: "Hapus jika tidak mengandung kata kotor", preferredStyle: .actionSheet)

        let cancelActionButton = UIAlertAction(title: "Cancel", style: .cancel) { _ in
        }
        actionSheetControllerIOS8.addAction(cancelActionButton)
           
        let deleteActionButton = UIAlertAction(title: "Hapus", style: .destructive) { _ in
            if let riwayat = self.riwayat {
                HistoryService().deleteHistory(riwayat)
            }
            self.navigationController?.popViewController(animated: true)
            
            NotificationCenter.default.post(name: .reload, object: nil)
        }
        actionSheetControllerIOS8.addAction(deleteActionButton)
        self.present(actionSheetControllerIOS8, animated: true, completion: nil)
    }
}

extension Notification.Name {
    static let reload = Notification.Name("reload")
}


