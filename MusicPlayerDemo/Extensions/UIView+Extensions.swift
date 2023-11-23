//
//  UIView+Extensions.swift
//  MusicPlayerDemo
//
//  Created by Ali Shaker on 23/11/2023.
//

import Foundation
import UIKit

public extension UIView {
    func dropShadow(shadowOpacity: Float = 0.2, shadowRadius: CGFloat = 5, shadowOffset: CGSize = .zero, color: UIColor? = nil) {
        layer.masksToBounds = false
        self.layer.shadowColor = color?.cgColor ?? UIColor.label.cgColor
        self.layer.shadowOpacity = shadowOpacity
        self.layer.shadowOffset = shadowOffset
        self.layer.shadowRadius = shadowRadius
        self.layer.masksToBounds = true
    }
    
    func addRoundedCorners(cornerRadius: CGFloat = 8.0) {
        self.layer.masksToBounds = true
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = true
    }
}
