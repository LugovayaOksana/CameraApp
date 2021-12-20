//
//  LaunchViewController.swift
//  CameraApp
//
//  Created by Оксана on 12.12.2021.
//

import UIKit

class LaunchViewController: UIViewController {
    
    private var requestCameraAuthorizationView: RequestCameraAuthorizationView?
    private var requestMicrophoneAuthorizationView: RequestMicrophoneAuthorizationView?
    private var requestPhotoLibraryAuthorizationView: RequestPhotoLibraryAuthorizationView?
    
    private var cameraAuthorizationStatus =
    RequestCameraAuthorizationController.getCameraAuthorizationStatus() {
        didSet {
            setupViewForNextAuthorizationRequest()
        }
    }
    
    private var microphoneAuthorizationStatus =
    RequestMicrophoneAuthorizationController.getMicrophoneAuthorizationStatus() {
        didSet {
            setupViewForNextAuthorizationRequest()
        }
    }
    
    private var photoLibraryAuthorizationStatus =
    RequestPhotoLibraryAuthorizationController.getPhotoLibraryAuthorizationStatus() {
        didSet {
            setupViewForNextAuthorizationRequest()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewForNextAuthorizationRequest()
    }
}

private extension LaunchViewController {
    func setupViewForNextAuthorizationRequest() {
        guard cameraAuthorizationStatus == .granted else {
            setupRequestCameraAuthorizationView()
            return
        }
        
        if let _ = requestCameraAuthorizationView {
            removeRequestCameraAuthorizationView()
            return
        }
        //next request microphone auth
        print("next request microphone auth")
        guard microphoneAuthorizationStatus == .granted else {
            setupRequestMicrophoneAuthorizationView()
            return
        }

        if let _ = requestMicrophoneAuthorizationView {
            removeRequestMicrophoneAuthorizationView()
            return
        }
        
        //next request photo library auth
        print("next request photo library auth")
        
        guard photoLibraryAuthorizationStatus == .granted else {
            setupRequestPhotoLibraryAuthorizationView()
            return
        }
        
        if let _ = requestPhotoLibraryAuthorizationView {
            removeRequestPhotoLibraryAuthorizationView()
            return
        }
        
        print("show capture view controller")
        
        DispatchQueue.main.async {
            AppSetup.loadCaptureViewController()
        }
        
    }
    
    func setupRequestCameraAuthorizationView() {
        guard requestCameraAuthorizationView == nil else {
            if cameraAuthorizationStatus == .unauthorized {
                requestCameraAuthorizationView?.configureForErrorState()
            }
            return
        }
        let requestCameraAuthorizationView = RequestCameraAuthorizationView()
        requestCameraAuthorizationView.translatesAutoresizingMaskIntoConstraints = false
        requestCameraAuthorizationView.delegate = self
        view.addSubview(requestCameraAuthorizationView)
        NSLayoutConstraint.activate([
            requestCameraAuthorizationView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            requestCameraAuthorizationView.topAnchor.constraint(equalTo: view.topAnchor),
            requestCameraAuthorizationView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            requestCameraAuthorizationView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        if cameraAuthorizationStatus == .unauthorized {
            requestCameraAuthorizationView.configureForErrorState()
        }
        requestCameraAuthorizationView.animateInView()
        self.requestCameraAuthorizationView = requestCameraAuthorizationView
    }
    
    func removeRequestCameraAuthorizationView(){
//        guard let requestCameraAuthorizationView = requestCameraAuthorizationView else {return}
        requestCameraAuthorizationView?.animateOutView(completion: { [weak self] in
            guard let self = self else {return}
//            requestCameraAuthorizationView.removeFromSuperview()
            self.requestCameraAuthorizationView = nil
            self.setupViewForNextAuthorizationRequest()
        })
    }
    
    func setupRequestMicrophoneAuthorizationView() {
        guard requestMicrophoneAuthorizationView == nil else {
            if microphoneAuthorizationStatus == .unauthorized {
                requestMicrophoneAuthorizationView?.configureForErrorState()
            }
            return
        }
        
        let requestMicrophoneAuthorizationView = RequestMicrophoneAuthorizationView()
        requestMicrophoneAuthorizationView.translatesAutoresizingMaskIntoConstraints = false
        requestMicrophoneAuthorizationView.delegate = self
        view.addSubview(requestMicrophoneAuthorizationView)
        NSLayoutConstraint.activate([
            requestMicrophoneAuthorizationView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            requestMicrophoneAuthorizationView.topAnchor.constraint(equalTo: view.topAnchor),
            requestMicrophoneAuthorizationView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            requestMicrophoneAuthorizationView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        if microphoneAuthorizationStatus == .unauthorized {
            requestMicrophoneAuthorizationView.configureForErrorState()
        }
        requestMicrophoneAuthorizationView.animateInView()
        self.requestMicrophoneAuthorizationView = requestMicrophoneAuthorizationView
    }
    
    func removeRequestMicrophoneAuthorizationView(){
//        guard let requestMicrophoneAuthorizationView = requestMicrophoneAuthorizationView else {return}
        requestMicrophoneAuthorizationView?.animateOutView(completion: { [weak self] in
            guard let self = self else {return}
//            requestMicrophoneAuthorizationView.removeFromSuperview()
            self.requestMicrophoneAuthorizationView = nil
            self.setupViewForNextAuthorizationRequest()
        })
    }
    
    func setupRequestPhotoLibraryAuthorizationView() {
        guard requestPhotoLibraryAuthorizationView == nil else {
            if photoLibraryAuthorizationStatus == .unauthorized {
                requestPhotoLibraryAuthorizationView?.configureForErrorState()
            }
            return
        }
        
        let requestPhotoLibraryAuthorizationView = RequestPhotoLibraryAuthorizationView()
        requestPhotoLibraryAuthorizationView.translatesAutoresizingMaskIntoConstraints = false
        requestPhotoLibraryAuthorizationView.delegate = self
        view.addSubview(requestPhotoLibraryAuthorizationView)
        NSLayoutConstraint.activate([
            requestPhotoLibraryAuthorizationView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            requestPhotoLibraryAuthorizationView.topAnchor.constraint(equalTo: view.topAnchor),
            requestPhotoLibraryAuthorizationView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            requestPhotoLibraryAuthorizationView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        if photoLibraryAuthorizationStatus == .unauthorized {
            requestPhotoLibraryAuthorizationView.configureForErrorState()
        }
        requestPhotoLibraryAuthorizationView.animateInView()
        self.requestPhotoLibraryAuthorizationView = requestPhotoLibraryAuthorizationView
    }
    
    func removeRequestPhotoLibraryAuthorizationView(){
//        guard let requestPhotoLibraryAuthorizationView = requestPhotoLibraryAuthorizationView else {return}
        requestPhotoLibraryAuthorizationView?.animateOutView(completion: { [weak self] in
            guard let self = self else {return}
//            requestPhotoLibraryAuthorizationView.removeFromSuperview()
            self.requestPhotoLibraryAuthorizationView = nil
            self.setupViewForNextAuthorizationRequest()
        })
    }
    
    func openSettings() {
        let settingsURLString = UIApplication.openSettingsURLString
        if let settingsURL = URL(string: settingsURLString) {
            UIApplication.shared.open(settingsURL, options: [:], completionHandler: nil)
        }
    }
    
    func requestCameraAuthorization() {
        if cameraAuthorizationStatus == .notRequested {
            RequestCameraAuthorizationController.requestCameraAuthorization { [weak self] status in
                guard let self = self else { return }
                self.cameraAuthorizationStatus = status
            }
            return
        }
        
        if cameraAuthorizationStatus == .unauthorized {
            openSettings()
            return
        }
    }
    
    func requestMicrophoneAuthorization() {
        if microphoneAuthorizationStatus == .notRequested {
            RequestMicrophoneAuthorizationController.requestMicrophoneAuthorization { [weak self] status in
                guard let self = self else { return }
                self.microphoneAuthorizationStatus = status
            }
            return
        }
        
        if microphoneAuthorizationStatus == .unauthorized {
            openSettings()
            return
        }
    }
    
    func requestPhotoLibraryAuthorization() {
        if photoLibraryAuthorizationStatus == .notRequested {
            RequestPhotoLibraryAuthorizationController.requestPhotoLibraryAuthorization { [weak self] status in
                guard let self = self else { return }
                self.photoLibraryAuthorizationStatus = status
            }
            return
        }
        
        if photoLibraryAuthorizationStatus == .unauthorized {
            openSettings()
            return
        }
    }
}

extension LaunchViewController: RequestCameraAuthorizationViewDelegate {
    func requestCameraAuthorizationActionButtonTapped() {
        print("request camera authorization button tapped")
        requestCameraAuthorization()
    }
}

extension LaunchViewController: RequestMicrophoneAuthorizationViewDelegate {
    func requestMicrophoneAuthorizationActionButtonTapped() {
        print("request microphone authorization button tapped")
        requestMicrophoneAuthorization()
    }
}

extension LaunchViewController: RequestPhotoLibraryAuthorizationViewDelegate {
    func requestPhotoLibraryAuthorizationTapped() {
        print("request PhotoLibrary authorization button tapped")
        requestPhotoLibraryAuthorization()
    }
}
