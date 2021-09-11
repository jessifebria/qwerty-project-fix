//
//  KeyboardButton.swift
//  SafeTypeKeyboard
//
//  Created by Jessi Febria on 06/09/21.
//

import UIKit

class KeyboardBasic: UIButton {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setup()
    }

    func setup() {
        self.layer.shadowColor = KeyboardColors.shadowNormal?.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
        self.layer.masksToBounds = false
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event:     UIEvent?) {
        super.touchesBegan(touches, with: event)
        selectedSetup()
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if isTouchInside {
            self.isHighlighted = false
        } else {
            normalSetup()
            super.touchesEnded(touches, with: event)
        }
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event:     UIEvent?) {
        normalSetup()
        super.touchesEnded(touches, with: event)
    }

    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        normalSetup()
        super.touchesCancelled(touches, with: event)
    }
    
    func selectedSetup(){
        self.layer.shadowColor = KeyboardColors.shadowSelected?.cgColor
        self.isHighlighted = false
        playSound()
    }
    
    func normalSetup(){
        self.layer.shadowColor = KeyboardColors.shadowNormal?.cgColor
        self.titleLabel?.textColor = UIColor.label
        self.isHighlighted = false
    }
    
    func playSound(){
        KeyboardSounds.playModifierSound()
    }
    
}

final class KeyboardButton: KeyboardBasic {
    
    override func selectedSetup(){
        super.selectedSetup()
        self.backgroundColor = KeyboardColors.bgBasicButtonSelected
    }
    
    override func normalSetup(){
        super.normalSetup()
        self.backgroundColor = KeyboardColors.bgBasicButton
    }
    
    override func playSound(){
        KeyboardSounds.playInsertSound()
    }
}

final class KeyboardSpecButton: KeyboardBasic {
    
    override func selectedSetup(){
        super.selectedSetup()
        self.backgroundColor = KeyboardColors.bgSpecButtonSelected
    }
    
    override func normalSetup(){
        super.normalSetup()
        self.backgroundColor = KeyboardColors.bgSpecButton
    }
    
    override func playSound(){
        KeyboardSounds.playModifierSound()
    }
    
}

final class DeleteButton: KeyboardBasic {
    
    override func selectedSetup(){
        super.selectedSetup()
        self.backgroundColor = KeyboardColors.bgSpecButtonSelected
        self.setImage(UIImage.init(systemName: "delete.left.fill"), for: .normal)
    }
    
    override func normalSetup(){
        super.normalSetup()
        self.backgroundColor = KeyboardColors.bgSpecButton
        self.setImage(UIImage.init(systemName: "delete.left"), for: .normal)
    }
    
    override func playSound(){
        KeyboardSounds.playDeleteSound()
    }
    
}
