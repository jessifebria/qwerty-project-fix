//
//  KataTerdeteksiViewController.swift
//  Qwerty
//
//  Created by Jonathan Herbert on 09/04/21.
//

import UIKit

class KataTerdeteksiViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var addKata: UITextField?
    @IBOutlet weak var tableView: UITableView!
    private var riwayatData = KataKotorService().getAllKataKotor()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return self.riwayatData.count
        }

        // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "KataKotorTableViewCell", for: indexPath) as! KataKotorTableViewCell
        cell.kata = riwayatData[indexPath.row]

        return cell
    }

        // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped cell number \(indexPath.row).")
    }

        // this method handles row deletion
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {

        if editingStyle == .delete {
            let alertMessage = UIAlertController(title: "Hapus Kata", message: "Hapus jika bukan merupakan kata kotor", preferredStyle: .actionSheet)
            let cancelButton = UIAlertAction(title: "Batal", style: .cancel, handler: nil)
            let hapusButton = UIAlertAction(title: "Hapus", style: .default){
                (ACTION:UIAlertAction) in
                KataKotorService().deleteKataKotor(self.riwayatData[indexPath.row])
                self.riwayatData.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
            
            alertMessage.addAction(cancelButton)
            alertMessage.addAction(hapusButton)
            self.present(alertMessage, animated: true)
        } else if editingStyle == .insert {
                // Not used in our example, but if you were adding a new row, this is where you would do it.
        }
    }
    
    
    @IBAction func addKataKotor(_ sender: UIButton) {
        let alertMessage = UIAlertController(title: "Tambahkan Kata", message: "Ketik kata kotor yang ingin Anda tambahkan untuk dideteksi", preferredStyle: .alert)
        alertMessage.addTextField(configurationHandler: addKata)
        let cancelButton = UIAlertAction(title: "Batal", style: .cancel, handler: nil)
        let okButton = UIAlertAction(title: "Tambah", style: .default, handler: self.okHandler)
        
        alertMessage.addAction(cancelButton)
        alertMessage.addAction(okButton)
        self.present(alertMessage, animated: true)
    }
    
    func addKata(textField : UITextField!){
        addKata = textField
        addKata?.placeholder = "Kata Kotor"
    }
    
    func okHandler(alert : UIAlertAction!) {
        if addKata?.text != "" {
            for i in riwayatData{
                if i.kata == addKata?.text{
                    let alertMessage = UIAlertController(title: "Tambahkan Kata", message: "Kata sudah ada didalam database", preferredStyle: .alert)
                    let cancelButton = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    
                    alertMessage.addAction(cancelButton)
                    self.present(alertMessage, animated: true)
                    return
                }
            }
            KataKotorService().addKataKotor(addKata?.text ?? "")
            riwayatData = KataKotorService().getAllKataKotor()
            tableView.reloadData()
        }
    }
}


