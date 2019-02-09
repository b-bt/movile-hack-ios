//
//  CameraView.swift
//  StreetPay
//
//  Created by Bruno Barbosa on 09/02/19.
//  Copyright © 2019 Bruno Barbosa. All rights reserved.
//

import UIKit
import AVFoundation

class CameraView: UIView {

    // MARK: Camera Properties and Functions
    private var captureCameraSession = AVCaptureSession()
    private lazy var cameraLayer: AVCaptureVideoPreviewLayer = AVCaptureVideoPreviewLayer(session: self.captureCameraSession)
    
    // Initializer:
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    func commonInit() {
        self.setupAVCapture(session: captureCameraSession,
                            cameraLayer: cameraLayer,
                            captureMetadataOutput: captureMetadataOutput,
                            videoDataOutputQueue: videoDataOutputQueue,
                            outputDelegate: self)
        self.startCapturing(self.captureCameraSession)
    }
}

extension CameraView: AVCaptureMetadataOutputObjectsDelegate {
    
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        // Check if the metadataObjects array is not nil and it contains at least one object.
        guard metadataObjects.count > 0 else {
            return
        }
        
        // Get the metadata object.
        let metadataObj = metadataObjects[0] as! AVMetadataMachineReadableCodeObject
        
        if metadataObj.type == AVMetadataObject.ObjectType.qr {
            // TODO: Check if valid vendor and call delegate method to display it
            print("QRCode: \(metadataObj.stringValue)")
            
            self.stopCapturing(self.captureCameraSession)
        }
    }
}
