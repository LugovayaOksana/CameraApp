//
//  UIView+AddShadow.swift
//  CameraApp
//
//  Created by Оксана on 12.12.2021.
//

import UIKit

extension UIView {
    func addShadow() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowRadius = 10
        layer.shadowOpacity = 0.3
        layer.masksToBounds = true
        layer.shadowOffset = CGSize(width: 5, height: 10)
        layer.cornerRadius = 4
    }
}
