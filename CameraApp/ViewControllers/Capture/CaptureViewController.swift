//
//  CaptureViewController.swift
//  CameraApp
//
//  Created by Оксана on 19.12.2021.
//

import UIKit

class CaptureViewController: UIViewController {
    
    @IBOutlet private weak var videoPreviewView: VideoPreviewView!
    @IBOutlet private weak var recordView: RecordView!
    
    private lazy var captureSessionController = CaptureSessionController()
    
    private var portraitConstraints = [NSLayoutConstraint()]
    private var landscapeConstraints = [NSLayoutConstraint()]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        videoPreviewView.videoPreviewLayer.session =
        captureSessionController.getCaptureSession()
        
        initializeConstraints()
        
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        print(size)
        
        if size.width > size.height {
            // landscape orientation
        } else {
            // portrait orientation
        }
        
        setupOrientationConstraints(size: size)
    }

}

private extension CaptureViewController {
    func initializeConstraints() {
        portraitConstraints = [
            recordView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            recordView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ]
        
        landscapeConstraints = [
            recordView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            recordView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ]
        
        let screenSize = UIScreen.main.bounds.size
        setupOrientationConstraints(size: screenSize)
    }
    
    func setupOrientationConstraints(size: CGSize) {
        if size.width > size.height {
            NSLayoutConstraint.deactivate(portraitConstraints)
            NSLayoutConstraint.activate(landscapeConstraints)
        } else {
            NSLayoutConstraint.deactivate(landscapeConstraints)
            NSLayoutConstraint.activate(portraitConstraints)
        }
    }
}
