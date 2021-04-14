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
        let result = contextService.loadKeyboardSetting(request)
        if result.count != 0 {
            let date = result[0].lastSeen!
            return date
        }
        else {
            return Converter.convertStringToDate(dateInString: "1999-12-01 00:00:00")
        }
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
