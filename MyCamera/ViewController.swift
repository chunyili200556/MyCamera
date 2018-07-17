//
//  ViewController.swift
//  MyCamera
//
//  Created by 黎峻亦 on 2018/7/16.
//  Copyright © 2018年 黎峻亦. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    
    @IBOutlet weak var imageView: UIImageView!
    private let picker = UIImagePickerController()
    // if you want to set cropped image ratio 16 : 9 , put 16/9 !
    private let cropper = UIImageCropper(cropRatio: 16/9)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cropper.delegate = self // Important !!!!!
    }
    
    @IBAction func cameraTapped(_ sender: UIButton) {
        cropper.picker = picker
        cropper.cropButtonText = "Crop"
        cropper.cancelButtonText = "Retake"
        
        let controller = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let takePicAction = UIAlertAction(title: "拍照", style: .default) { (_) in
            self.picker.sourceType = .camera
            self.present(self.picker, animated: true, completion: nil)
        }
        let pickPicAction = UIAlertAction(title: "從相簿選擇照片", style: .default) { (_) in
            self.picker.sourceType = .photoLibrary
            self.present(self.picker, animated: true, completion: nil)
        }
        let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        controller.addAction(takePicAction)
        controller.addAction(pickPicAction)
        controller.addAction(cancelAction)
        self.present(controller, animated: true, completion: nil)
    }
    
}

extension ViewController : UIImageCropperProtocol{
    func didCropImage(originalImage: UIImage?, croppedImage: UIImage?) {
        imageView.image = croppedImage
    }
}

