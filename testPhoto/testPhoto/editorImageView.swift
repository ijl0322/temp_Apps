//
//  editorImageView.swift
//  testPhoto
//
//  Created by Isabel  Lee on 25/02/2017.
//  Copyright © 2017 Isabel  Lee. All rights reserved.
//

import UIKit

class editorImageView: UIImageView {
    
    var oldImage: UIImage!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        isUserInteractionEnabled = true
    }
    
    var newImage: UIImage {
        get {
            UIGraphicsBeginImageContextWithOptions(frame.size, true, 0)
            drawHierarchy(in: bounds, afterScreenUpdates: true)
            let result = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            
            return result!
        }
    }
    
    func addSticker(){
        let newSticker = stickers(imageName: "bunny")
        self.addSubview(newSticker)
    }
    
    
}
