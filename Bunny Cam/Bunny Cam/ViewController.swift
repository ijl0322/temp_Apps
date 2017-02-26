//
//  ViewController.swift
//  Bunny Cam
//
//  Created by Isabel  Lee on 25/02/2017.
//  Copyright © 2017 Isabel  Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate{

    var userImg: UIImage?
    
    let imagePicker = UIImagePickerController()
    
    @IBAction func camera(_ sender: UIButton) {
        imagePicker.sourceType = UIImagePickerControllerSourceType.camera
        self.present(imagePicker, animated: true){
            
        }
    }
    @IBAction func library(_ sender: UIButton) {
        imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
        self.present(imagePicker, animated: true){
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        imagePicker.delegate = self
        imagePicker.allowsEditing = false
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.isNavigationBarHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {

        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage{

            self.userImg = pickedImage
            self.performSegue(withIdentifier: "imageViewSegue", sender: self)
            print("segue perform")

        } else {
            print("Error adding image")
        }
        dismiss(animated: true, completion: nil)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "imageViewSegue"{
            let vc = segue.destination as! ImageViewController
            vc.userImg = userImg
        }
    }
}

