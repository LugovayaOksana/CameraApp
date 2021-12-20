//
//  UIView+Animation.swift
//  CameraApp
//
//  Created by Оксана on 12.12.2021.
//

import UIKit

extension UIView {
    func animateInView(delay: TimeInterval){
        alpha = 0
        transform = CGAffineTransform(translationX: 0, y: -20)
        let animation = UIViewPropertyAnimator(duration: 0.2, curve: .easeInOut) {
            self.alpha = 1
            self.transform = .identity
        }
        animation.startAnimation(afterDelay: delay)
    }
    
    func animateOutView(delay: TimeInterval, completion:(() -> Void)? = nil){
        let animation = UIViewPropertyAnimator(duration: 0.2, curve: .easeInOut) {
            self.alpha = 0
            self.transform = CGAffineTransform(translationX: 0, y: -20)
        }
        animation.startAnimation(afterDelay: delay)
        animation.addCompletion{ _ in
            completion?()
        }
    }
}
