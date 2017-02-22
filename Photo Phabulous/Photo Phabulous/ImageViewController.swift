//
//  ImageViewController.swift
//  Photo Phabulous
//
//  Created by Isabel  Lee on 22/02/2017.
//  Copyright © 2017 Isabel  Lee. All rights reserved.
//

// - Attribution: https://www.youtube.com/watch?v=a89c67TIh10
// - Attribution: https://www.youtube.com/watch?v=dfy7tu5m-p8
// - Attribution: https://www.youtube.com/watch?v=a89c67TIh10


import UIKit
import Social

class ImageViewController: UIViewController {
    
    var image: UIImage?
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func shareButton(_ sender: UIBarButtonItem) {
        if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeTwitter){
            let vc = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
            vc?.add(image)
            present(vc!, animated: true, completion: nil)
        } else {
            print("Service not available")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let image = image {
            self.imageView.image = image
        }
    }
}
