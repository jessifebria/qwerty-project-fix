//
//  SettingsItem.swift
//  SafeType
//
//  Created by Yafonia Hutabarat on 16/09/21.
//

enum SettingsItem: String, CaseIterable {
    case KataTerdeteksi = "Kata Terdeteksi", Bantuan = "Bantuan"
    
    func detail() -> String {
        switch self {
        case .KataTerdeteksi:
            return "Lihat, tambah, dan hapus kata yang terdeteksi oleh aplikasi"
        case .Bantuan:
            return "Pelajari cara menggunakan aplikasi"
        }
    }
    
    func imageName() -> String {
        switch self {
        case .KataTerdeteksi:
            return "scroll.fill"
        case .Bantuan:
            return "questionmark"
        }
    }
}
