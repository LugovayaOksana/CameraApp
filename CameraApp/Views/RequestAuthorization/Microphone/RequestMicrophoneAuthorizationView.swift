//
//  RequestMicrofoneAuthorizationView.swift
//  CameraApp
//
//  Created by Оксана on 12.12.2021.
//

import UIKit

protocol RequestMicrophoneAuthorizationViewDelegate: class {
    func requestMicrophoneAuthorizationActionButtonTapped()
}

class RequestMicrophoneAuthorizationView: UIView {

    @IBOutlet private weak var contentView: UIView!
    @IBOutlet private weak var microphoneImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var messageLabel: UILabel!
    @IBOutlet private weak var actionButton: UIButton!
    @IBOutlet private weak var actionButtonWidthConstraint: NSLayoutConstraint!
    
    weak var delegate: RequestMicrophoneAuthorizationViewDelegate?

        
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
            delegate?.requestMicrophoneAuthorizationActionButtonTapped()
        }

    func animateInView(){

        let viewsToAnimate = [microphoneImageView, titleLabel, messageLabel, actionButton]

        for (i, viewToAnimate) in viewsToAnimate.enumerated(){
            guard let view = viewToAnimate else {continue}
            view.animateInView(delay: Double(i) * 0.15)
        }
    }

    func animateOutView(completion: @escaping () -> Void){
        let viewsToAnimate = [microphoneImageView, titleLabel, messageLabel, actionButton]
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
        titleLabel.text = "Microphone Authorization Denied"
        actionButton.setTitle("Open Settings", for: .normal)
        actionButtonWidthConstraint.constant = 120
    }
}

private extension RequestMicrophoneAuthorizationView {
    func setupActionButtonShadow(){
        actionButton.addShadow()
    }
}
