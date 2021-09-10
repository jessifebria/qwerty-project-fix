//
//  KeyboardButton.swift
//  SafeTypeKeyboard
//
//  Created by Jessi Febria on 06/09/21.
//

import UIKit

final class KeyboardButton: UIButton {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setup()
    }

    func setup() {
        self.layer.shadowColor = KeyboardColors.shadowNormal?.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
        self.layer.masksToBounds = false
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event:     UIEvent?) {
        super.touchesBegan(touches, with: event)
        selectedSetup()
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        normalSetup()
//        #error("FAILED DISINI, HARUSNYA PAS MOVED BS TRIGGER KE YG LAIN")
        super.touchesEnded(touches, with: event)
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
        self.backgroundColor = KeyboardColors.bgBasicButtonSelected
        self.layer.shadowColor = KeyboardColors.shadowSelected?.cgColor
        self.isHighlighted = false
    }
    
    func normalSetup(){
        self.backgroundColor = KeyboardColors.bgBasicButton
        self.layer.shadowColor = KeyboardColors.shadowNormal?.cgColor
        self.titleLabel?.textColor = UIColor.label
    }
    
}

final class KeyboardSpecButton: UIButton {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setup()
    }

    func setup() {
        self.layer.shadowColor = KeyboardColors.shadowNormal?.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
//        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
        self.layer.masksToBounds = false
    }
    
}
