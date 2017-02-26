//
//  ViewController.swift
//  testPhoto
//
//  Created by Isabel  Lee on 25/02/2017.
//  Copyright © 2017 Isabel  Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var myImage: UIImageView!
    
    @IBAction func addPhoto(_ sender: UIButton) {
        let imgPicker = UIImagePickerController()
        imgPicker.allowsEditing = false
        imgPicker.sourceType = .photoLibrary
        imgPicker.delegate = self
        self.present(imgPicker, animated: true)
        
    }
    
    @IBAction func addSticker(_ sender: UIButton) {
        let newSticker = stickers(imageName: "bunny")
        view.addSubview(newSticker)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImg = info[UIImagePickerControllerOriginalImage] as! UIImage? {
            self.myImage.image = pickedImg
            
        }
        self.dismiss(animated: true, completion: nil)
    }
}

