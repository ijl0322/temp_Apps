//
//  stickers.swift
//  testPhoto
//
//  Created by Isabel  Lee on 25/02/2017.
//  Copyright © 2017 Isabel  Lee. All rights reserved.
//

import UIKit

class stickers: UIImageView, UIGestureRecognizerDelegate {
    
    init(imageName: String) {
        let sticker = UIImage(named: imageName)
        super.init(image: sticker)
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(self.handlePan(_:)))
        panGestureRecognizer.delegate = self
        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(panGestureRecognizer)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func handlePan(_ recognizer: UIPanGestureRecognizer!) {
        
        let translation = recognizer.translation(in: recognizer.view)
        
        if let view = recognizer.view {
            view.center = CGPoint(x:view.center.x + translation.x,
                                y:view.center.y + translation.y)
        }
        recognizer.setTranslation(CGPoint.zero, in: recognizer.view)

    }
    
    
}
