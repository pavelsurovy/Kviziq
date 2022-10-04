//
//  Extensions.swift
//  Kviziq
//
//  Created by Palino on 04/10/2022.
//

import UIKit

extension UIButton {
    func disabledButtonStyle() {
        self.backgroundColor = Farby.cervena
    }
    
    func enabledButtonStyle() {
        self.backgroundColor = .clear
    }
}
