//
//  RequestMicrophoneAuthorizationController.swift
//  CameraApp
//
//  Created by Оксана on 12.12.2021.
//

import Foundation
import AVFoundation

enum MicrophoneAuthorizationStatus {
    case notRequested
    case granted
    case unauthorized
}

typealias RequestMicrophoneAuthorizationCompletionHandler = (MicrophoneAuthorizationStatus) -> Void

class RequestMicrophoneAuthorizationController {
    
    static func requestMicrophoneAuthorization(completionHandler: @escaping RequestMicrophoneAuthorizationCompletionHandler) {
        AVCaptureDevice.requestAccess(for: .audio, completionHandler: { granted in
            DispatchQueue.main.async {
                guard granted else {
                    completionHandler(.unauthorized)
                    return
                }
                completionHandler(.granted)
            }
        })
    }
    
    static func getMicrophoneAuthorizationStatus() -> MicrophoneAuthorizationStatus {
        let status = AVCaptureDevice.authorizationStatus(for: .audio)
        switch status {
        case .authorized: return .granted
        case .notDetermined: return .notRequested
        default: return .unauthorized
        }
    }
    
}
