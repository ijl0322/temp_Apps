//
//  ImageViewController.swift
//  Photo Phabulous
//
//  Created by Isabel  Lee on 22/02/2017.
//  Copyright © 2017 Isabel  Lee. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {
    
    var image: UIImage?
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let image = image {
            self.imageView.image = image
        }
    }
}
