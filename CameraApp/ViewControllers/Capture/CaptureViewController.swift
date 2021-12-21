//
//  CaptureViewController.swift
//  CameraApp
//
//  Created by Оксана on 19.12.2021.
//

import UIKit

class CaptureViewController: UIViewController {
    
    @IBOutlet private weak var videoPreviewView: VideoPreviewView!
    
    private lazy var captureSessionController = CaptureSessionController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        videoPreviewView.videoPreviewLayer.session =
        captureSessionController.getCaptureSession()
    
    }

}
