//
//  SettingsItem.swift
//  SafeType
//
//  Created by Yafonia Hutabarat on 16/09/21.
//

struct SettingsItem {
    var name: String?
    var detail: String?
    var image: String?
    
    func createSettingsItem() -> [SettingsItem] {
        var settingsItems = [SettingsItem]()
        
        let kataTerdeteksi = SettingsItem(name: "Kata Terdeteksi", detail: "Lihat, tambah, dan hapus kata yang terdeteksi oleh aplikasi", image: "scroll.fill")
        let bantuan = SettingsItem(name: "Bantuan", detail: "Pelajari cara menggunakan aplikasi", image: "questionmark")
        
        
        settingsItems.append(kataTerdeteksi)
        settingsItems.append(bantuan)
        
        return settingsItems
    }
}
