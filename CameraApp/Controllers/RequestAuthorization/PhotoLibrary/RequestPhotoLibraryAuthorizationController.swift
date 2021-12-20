//
//  RequestPhotoLibraryAuthorizationController.swift
//  CameraApp
//
//  Created by Оксана on 12.12.2021.
//

import Foundation
import Photos

enum PhotoLibraryAuthorizationStatus {
    case granted
    case notRequested
    case unauthorized
}

typealias RequestPhotoLibraryAuthorizationCompletionHandler = (PhotoLibraryAuthorizationStatus) -> Void

class RequestPhotoLibraryAuthorizationController {
    
    static func requestPhotoLibraryAuthorization(completionHandler: @escaping RequestPhotoLibraryAuthorizationCompletionHandler) {
        PHPhotoLibrary.requestAuthorization { status in
            DispatchQueue.main.async {
                guard status == .authorized else {
                    completionHandler(.unauthorized)
                    return
                }
                completionHandler(.granted)
            }
        }
    }
    
    static func getPhotoLibraryAuthorizationStatus() -> PhotoLibraryAuthorizationStatus {
        let status = PHPhotoLibrary.authorizationStatus()
        switch status {
        case .authorized: return .granted
        case .notDetermined: return .notRequested
        default: return .unauthorized
        }
    }
    
}
