//
//  SharkSwim.swift
//  PolarAdventure
//
//  Created by Isabel  Lee on 05/04/2017.
//  Copyright © 2017 Isabel  Lee. All rights reserved.
//

import UIKit

class Shark: UIImageView {
    
    let Bounds = Size()
    var screenWidth: Double = 0
    var screenHeight: Double = 0
    var penguinYPosition = 0.0
    var penguinXPosition = 0.0
    var sharkSize = 0.0
    var iceBergLeftBound =  0.0
    var iceBergRightBound = 0.0
    let step = 30.0
    
    var swimImg = [UIImage(named: "shark_swim1")!,UIImage(named: "shark_swim2")!]
    var talkImg = [UIImage(named: "shark_swim1")!, UIImage(named: "shark_talk")!]
    
    init() {
        screenWidth = Bounds.screenWidth
        screenHeight = Bounds.screenHeight
        sharkSize = screenWidth * 0.3
        penguinYPosition = screenHeight * 0.7
        penguinXPosition = screenWidth * 0.9
        iceBergLeftBound = screenWidth * 0.73
        iceBergRightBound = screenWidth * 0.25
        
        super.init(frame: CGRect(x: penguinXPosition, y: penguinYPosition, width: sharkSize, height: sharkSize))
        
        self.isUserInteractionEnabled = true
        self.contentMode = .scaleAspectFit
        self.image = swimImg[0]
        self.animationImages = swimImg
        self.animationDuration = 0.4
        self.animationRepeatCount = 5
    }
    
    func startSwim() {
        self.image = swimImg[0]
        self.startAnimating()
        UIView.animate(withDuration: 2, delay: 0, options: .curveEaseOut, animations: {
            self.center.x = CGFloat(self.iceBergLeftBound)
        }, completion: nil)
    }
    
    func talk() {
        self.image = talkImg[0]
        self.animationImages = talkImg
        self.startAnimating()
    }

    func hitIceBerg() {
        self.startAnimating()
        UIView.animate(withDuration: 0.6, delay: 0, options: .curveEaseOut, animations: {
            self.center.x = CGFloat(self.screenWidth/2 + self.sharkSize*0.47)
        }, completion: { (finish) in
            self.stopAnimating()
            self.image = UIImage(named: "shark_hit")
            
            UIView.animate(withDuration: 0.3, animations: {
                self.transform = CGAffineTransform(rotationAngle: (-30.0 * CGFloat(Double.pi)) / 180.0)
            }, completion: {(finish) in
                UIView.animate(withDuration: 0.5, animations: {
                    self.transform = CGAffineTransform(rotationAngle: (0.0 * CGFloat(Double.pi)) / 180.0)
                }, completion: nil)
            })
            
        })
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
