//
//  ViewController.swift
//  TEST
//
//  Created by student on 2024/12/3.
//

import UIKit
import AVFoundation
import Photos
import PhotosUI

class ViewController: UIViewController {
    
    var images:[UIImage] = []
    @IBOutlet weak var imageview: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AVCaptureDevice.requestAccess(for: .video) { flag in
            if flag {
                print("授权成功")
            }
        }
        
        PHPhotoLibrary.requestAuthorization { status in
            print(status.rawValue)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        photo2()
        //        photo()
        //        camera()
    }
    func camera() {
        let imageViewController = UIImagePickerController()
        imageViewController.sourceType = .camera
        imageViewController.cameraDevice = .front
        imageViewController.delegate = self
        present(imageViewController, animated: true, completion: nil)
    }
    
    func photo() {
        let imageViewController = UIImagePickerController()
        imageViewController.delegate = self
        imageViewController.allowsEditing = true
        present(imageViewController, animated: true, completion: nil)
    }
    
    func photo2() {
        var config = PHPickerConfiguration(photoLibrary: .shared())
        config.selectionLimit = 3
        let PickerViewController = PHPickerViewController(configuration: config)
        PickerViewController.delegate = self
        present(PickerViewController, animated: true, completion: nil)
    }
}
extension ViewController:PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        print(#function)
        picker.dismiss(animated: true, completion: nil)
        
        for result in results {
            result.itemProvider.loadObject(ofClass: UIImage.self) { (object, error) in
                if error == nil {
                    if let image = object as? UIImage {
                        self.images.append(image)
                    }
                    OperationQueue.main.addOperation {
                        self.imageview.animationImages = self.images
                        self.imageview.animationDuration = 5
                        self.imageview.startAnimating()
                    }
                }
            }
        }
    }
}

extension ViewController:UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        print(#function)
        picker.dismiss(animated: true, completion: nil)
        if let image = info[.editedImage] as? UIImage {
            self.imageview.image = image
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print(#function)
        picker.dismiss(animated: true, completion: nil)
    }
}
