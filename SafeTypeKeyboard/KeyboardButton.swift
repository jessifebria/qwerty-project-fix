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
        self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
        self.layer.masksToBounds = false
//        self.layer.cornerRadius = 4.0
    }
}
