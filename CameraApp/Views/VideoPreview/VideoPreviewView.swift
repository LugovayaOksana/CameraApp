//
//  VideoPreviewView.swift
//  CameraApp
//
//  Created by Оксана on 20.12.2021.
//

import UIKit
import AVFoundation

class VideoPreviewView: UIView {

    override class var layerClass: AnyClass {
        return AVCaptureVideoPreviewLayer.self
    }

}
