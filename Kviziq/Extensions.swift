//
//  Extensions.swift
//  Kviziq
//
//  Created by Palino on 04/10/2022.
//

import UIKit

extension UIButton {
    func disabledButtonStyle() {
        self.isEnabled = false
        self.setTitleColor(.black, for: .disabled)
        self.backgroundColor = Farby.cervena
    }
    
    func enabledButtonStyle() {
        self.isEnabled = true
        self.setTitleColor(.black, for: .normal)
        self.backgroundColor = .clear
    }
}
