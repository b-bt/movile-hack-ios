//
//  UIView+Camera.swift
//  StreetPay
//
//  Created by Bruno Barbosa on 09/02/19.
//  Copyright © 2019 Bruno Barbosa. All rights reserved.
//

import UIKit
import AVFoundation

extension UIView {
    func setupAVCapture(session: AVCaptureSession,
                        cameraLayer: AVCaptureVideoPreviewLayer,
                        captureMetadataOutput: AVCaptureMetadataOutput,
                        videoDataOutputQueue: DispatchQueue,
                        outputDelegate: AVCaptureMetadataOutputObjectsDelegate) {
        
        guard let videoDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back) else {
            return
        }
        
        guard let deviceInput = try? AVCaptureDeviceInput(device: videoDevice) else {
            return
        }
        
        session.beginConfiguration()
        session.sessionPreset = .photo
        
        guard session.canAddInput(deviceInput) else {
            session.commitConfiguration()
            return
        }
        
        session.addInput(deviceInput)
        
        guard session.canAddOutput(captureMetadataOutput) else {
            print("Could not add metadata output to the session")
            session.commitConfiguration()
            return
        }
        
        session.addOutput(captureMetadataOutput)
        captureMetadataOutput.setMetadataObjectsDelegate(outputDelegate, queue: videoDataOutputQueue)
        captureMetadataOutput.metadataObjectTypes = [AVMetadataObject.ObjectType.qr]
        
        session.commitConfiguration()
        
        cameraLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        cameraLayer.frame = self.layer.bounds
        self.layer.addSublayer(cameraLayer)
    }
    
    func startCapturing(_ session: AVCaptureSession) {
        session.startRunning()
    }
    
    func stopCapturing(_ session: AVCaptureSession) {
        session.stopRunning()
    }
}
