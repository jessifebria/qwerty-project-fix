//
//  SettingViewController.swift
//  Qwerty
//
//  Created by Jonathan Herbert on 09/04/21.
//

import UIKit

class SettingViewController: UIViewController {

    @IBOutlet weak var settingsTableView: UITableView!
    var staticSettingsItem = SettingsItem()
    var settingsItems = [SettingsItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingsItems = staticSettingsItem.createSettingsItem()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "Pengaturan"
        
        settingsTableView.delegate = self
        settingsTableView.dataSource = self

    }
    
    @IBAction func selesaiButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}

extension SettingViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
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
        return 92
    }
    
    
}
