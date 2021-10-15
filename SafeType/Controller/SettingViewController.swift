//
//  SettingViewController.swift
//  Qwerty
//
//  Created by Jonathan Herbert on 09/04/21.
//

import UIKit

class SettingViewController: UIViewController {

    @IBOutlet weak var settingsTableView: UITableView!
    var settingsItems = [SettingsItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for item in SettingsItem.allCases {
            settingsItems.append(item)
        }
        
        settingsTableView.delegate = self
        settingsTableView.dataSource = self
        settingsTableView.tableFooterView = UIView()
        self.title = "Pengaturan"
        self.navigationController?.setupNavBar()
        self.navigationController?.navigationBar.prefersLargeTitles = true

    }
        
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        self.navigationController?.changeBackground()
    }
    
    @IBAction func deleteAllButton(_ sender: Any) {
        showDeleteAlert()
    }
    
    func showDeleteAlert() {
        let alert = UIAlertController(title: "Apakah Anda yakin?", message: "Semua data akan terhapus dan tidak dapat dikembalikan.", preferredStyle: UIAlertController.Style.alert)
       
        let cancel = UIAlertAction(title: "Tidak", style: .cancel, handler: { (action : UIAlertAction!) -> Void in
            
        })
        let yesAction = UIAlertAction(title: "Ya", style: .default, handler: { (action) -> Void in
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "DeleteAllViewController") as! DeleteAllViewController
            vc.modalPresentationStyle = .fullScreen //or .overFullScreen for transparency
            self.present(vc, animated: true, completion: nil)
        })
        alert.addAction(cancel)
        alert.addAction(yesAction)
        alert.preferredAction = yesAction
        
        present(alert, animated: true, completion: nil)
    }
    
}

extension SettingViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch settingsItems[indexPath.row] {
        case .KataTerdeteksi:
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "KataTerdeteksiViewController") as! KataTerdeteksiViewController
            self.navigationController?.pushViewController(vc, animated: true)
        case .Bantuan:
            let vc = BantuanViewController()
            self.navigationController?.pushViewController(vc, animated: true)
            print("bantuan")
        }
    }
}

extension SettingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingsItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingsCell", for: indexPath) as! SettingsTableViewCell
        cell.settingsItem = settingsItems[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 115
    }
    
    
}
