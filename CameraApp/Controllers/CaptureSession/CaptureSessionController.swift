//
//  CaptureSessionController.swift
//  CameraApp
//
//  Created by Оксана on 21.12.2021.
//

import Foundation
import AVFoundation

class CaptureSessionController: NSObject {
    private lazy var captureSession = AVCaptureSession()
    
    override init() {
        super.init()
        
        if let captureDevice =  AVCaptureDevice.default(
            .builtInDualWideCamera,
            for: .video,
            position: .back) {
            
            if let deviceInput = try? AVCaptureDeviceInput(device: captureDevice) {
                captureSession.addInput(deviceInput)
            }
            
            captureSession.startRunning()
        }
    }
    
    func getCaptureSession() -> AVCaptureSession {
        return captureSession
    }
}
