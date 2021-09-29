//
//  ViewExtension.swift
//  SafeType
//
//  Created by Yafonia Hutabarat on 20/09/21.
//

import Foundation
import UIKit

func setStandardNavigationBar(navBar: UINavigationBar) {
    let appearance = UINavigationBarAppearance()
    appearance.configureWithOpaqueBackground()
    appearance.backgroundColor = #colorLiteral(red: 0, green: 0.3772116005, blue: 0.6474196315, alpha: 1)
    appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    navBar.standardAppearance = appearance
    navBar.scrollEdgeAppearance = navBar.standardAppearance
}
