//
//  KeyboardService.swift
//  Qwerty
//
//  Created by Jessi Febria on 08/04/21.
//

import Foundation

class KeyboardService {
    func isKeyboardExtensionEnabled() -> Bool {

        let keyboards = UserDefaults.standard.dictionaryRepresentation()["AppleKeyboards"] as? [String]

        let keyboardExtensionBundleID = "com.jessifebria.Qwerty.QwertyKeyboard"
        if keyboards!.contains(keyboardExtensionBundleID) {
            return true
        }
        
        return false
    }
    
}
