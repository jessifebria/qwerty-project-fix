//
//  KeyboardSounds.swift
//  SafeTypeKeyboard
//
//  Created by Jessi Febria on 11/09/21.
//

import AVFoundation

class KeyboardSounds {
    
    static func playInsertSound() {
        AudioServicesPlaySystemSound(1104)
    }

    static func playDeleteSound(){
        AudioServicesPlaySystemSound(1155)
    }
    
    static func playModifierSound(){
        AudioServicesPlaySystemSound(1156)
    }
}
