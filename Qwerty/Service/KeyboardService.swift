//
//  KeyboardService.swift
//  Qwerty
//
//  Created by Jessi Febria on 08/04/21.
//

import Foundation
import CoreData

class KeyboardService {
    
    let contextService = ContextService()
    
    func getLastSeen() -> Date{
        let request : NSFetchRequest<Keyboard> = Keyboard.fetchRequest()
        return contextService.loadKeyboardSetting(request)[0].lastSeen!
    }
    
    func isKeyboardExtensionEnabled() -> Bool {

        let keyboards = UserDefaults.standard.dictionaryRepresentation()["AppleKeyboards"] as? [String]

        let keyboardExtensionBundleID = "com.jessifebria.Qwerty.QwertyKeyboard"
        if keyboards!.contains(keyboardExtensionBundleID) {
            return true
        }
        
        return false
    }
   
    
    
}
