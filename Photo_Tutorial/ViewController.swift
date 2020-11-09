//
//  ViewController.swift
//  Photo_Tutorial
//
//  Created by Seokhyun Kim on 2020-11-08.
//

import UIKit
import YPImagePicker

class ViewController: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //To make circle Image
        profileImage.layer.cornerRadius = profileImage.frame.height / 2
        profileButton.layer.cornerRadius = 10
        profileButton.addTarget(self, action: #selector(profileBtnTapped), for: .touchUpInside)
    }
    
    @objc fileprivate func profileBtnTapped() {
        //Configuration of camera
        var config = YPImagePickerConfiguration()
        //If you want to use all of functions
        //config.screens = [.library, .photo, .video]
        config.screens = [.library]
        // [Edit configuration here ...]
        // Build a picker with your configuration
        let picker = YPImagePicker(configuration: config)
        //complection block
                picker.didFinishPicking { [unowned picker] items, _ in
            if let photo = items.singlePhoto {
                self.profileImage.image = photo.image
                print(photo.fromCamera) // Image source (camera or library)
                print(photo.image) // Final image selected by the user
                print(photo.originalImage) // original image selected by the user, unfiltered
                print(photo.modifiedImage) // Transformed image, can be nil
                print(photo.exifMeta) // Print exif meta data of original image.
            }
            picker.dismiss(animated: true, completion: nil)
        }
        present(picker, animated: true, completion: nil)
    }


}

