//
//  AppSetup.swift
//  CameraApp
//
//  Created by Оксана on 19.12.2021.
//

import UIKit

class AppSetup {
    static func loadCaptureViewController(){
        let nibName = String(describing: CaptureViewController.self)
        let bundle = Bundle.main
        let captureViewcontroller = CaptureViewController(nibName: nibName, bundle: bundle)
        let window = Self.keyWindow
        window?.rootViewController = captureViewcontroller
        window?.makeKeyAndVisible()
    }
    
    static var keyWindow: UIWindow? {
        return UIApplication.shared.windows.first(where: { $0.isKeyWindow} )
    }
}
