//
//  RequestCameraAuthorizationView.swift
//  CameraApp
//
//  Created by Оксана on 12.12.2021.
//

import UIKit

//setup touch action event for the Action Button. Head to swift file again and setup view delegate to inform implementing class about the action button tap even
protocol RequestCameraAuthorizationViewDelegate: class {
    func requestCameraAuthorizationActionButtonTapped()
}

class RequestCameraAuthorizationView: UIView {
    @IBOutlet private weak var contentView: UIView!
    
    @IBOutlet private weak var cameraImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var messageLabel: UILabel!
    @IBOutlet private weak var actionButton: UIButton!
    @IBOutlet private weak var actionButtonWidthConstraint: NSLayoutConstraint!
    
    weak var delegate: RequestCameraAuthorizationViewDelegate?

        
        override init(frame: CGRect) {
            super.init(frame: frame)
            customInit()
        }
        
        required init?(coder: NSCoder) {
            super.init(coder: coder)
            customInit()
        }
        
        private func customInit() {
            let bundle = Bundle.main
            let nibName = String(describing: Self.self)
            bundle.loadNibNamed(nibName, owner: self, options: nil)
            addSubview(contentView)
            contentView.frame = bounds
            contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            
            setupActionButtonShadow()
        }
    
    //setup touch action event for the Action Button
    @IBAction func actionButtonHandler(btn: UIButton) {
            delegate?.requestCameraAuthorizationActionButtonTapped()
        }

    func animateInView(){
        let viewsToAnimate = [cameraImageView, titleLabel, messageLabel, actionButton]
        for (i, viewToAnimate) in viewsToAnimate.enumerated(){
            guard let view = viewToAnimate else {continue}
            view.animateInView(delay: Double(i) * 0.15)
        }
    }
    
    func animateOutView(completion: @escaping () -> Void){
        let viewsToAnimate = [cameraImageView, titleLabel, messageLabel, actionButton]
        for (i, viewToAnimate) in viewsToAnimate.enumerated(){
            guard let view = viewToAnimate else {continue}
            var completionHandler: (() -> Void)? = nil
            if viewToAnimate == viewsToAnimate.last {
                completionHandler = completion
            }
            view.animateOutView(delay: Double(i) * 0.15, completion: completionHandler)
        }
    }
    
    func configureForErrorState(){
        titleLabel.text = "Camera Authorization Denied"
        actionButton.setTitle("Open Settings", for: .normal)
        actionButtonWidthConstraint.constant = 130
    }
}

private extension RequestCameraAuthorizationView {
    func setupActionButtonShadow(){
        actionButton.addShadow()
    }

}
