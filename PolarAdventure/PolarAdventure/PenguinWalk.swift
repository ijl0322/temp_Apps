//
//  PenguinWalk.swift
//  PolarAdventure
//
//  Created by Isabel  Lee on 05/04/2017.
//  Copyright © 2017 Isabel  Lee. All rights reserved.
//

// Attribution: http://www.appcoda.com/ios-programming-animation-uiimageview/
// Attribution: https://www.gameartguppy.com/shop/penguin/


import UIKit

class Penguin: UIImageView, UIGestureRecognizerDelegate {
    
    let Bounds = Size()
    var screenWidth: Double = 0
    var screenHeight: Double = 0
    var penguinYPosition = 0.0
    var penguinXPosition = 0.0
    var penguinSize = 0.0
    var iceBergLeftBound =  0.0
    var iceBergRightBound = 0.0
    let step = 30.0
    

    let walkRightImg = [UIImage(named: "penguin_walk1")!,UIImage(named: "penguin_walk2")!, UIImage(named: "penguin_walk3")!, UIImage(named: "penguin_walk4")!]
    let walkLeftImg = [UIImage(named: "penguin_l_walk1")!,UIImage(named: "penguin_l_walk2")!, UIImage(named: "penguin_l_walk3")!, UIImage(named: "penguin_l_walk4")!]
    let dizzyImg = [UIImage(named: "penguin_dizzy1")!, UIImage(named: "penguin_dizzy2")!]
    
    
    init() {
        screenWidth = Bounds.screenWidth
        screenHeight = Bounds.screenHeight
        penguinSize = screenWidth * 0.15
        penguinYPosition = screenHeight * 0.35
        penguinXPosition = screenWidth * 0.4
        iceBergLeftBound = screenWidth * 0.73
        iceBergRightBound = screenWidth * 0.25
        
        super.init(frame: CGRect(x: penguinXPosition, y: penguinYPosition, width: penguinSize, height: penguinSize))
        
        let swipeLeftGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(swipeLeft(_:)))
        swipeLeftGestureRecognizer.direction = UISwipeGestureRecognizerDirection.left
        let swipeRightGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(swipeRight(_:)))
        swipeRightGestureRecognizer.direction = UISwipeGestureRecognizerDirection.right
        
        //self.addGestureRecognizer(swipeLeftGestureRecognizer)
        //self.addGestureRecognizer(swipeRightGestureRecognizer)
        
        self.isUserInteractionEnabled = true
        self.contentMode = .scaleAspectFit
        self.image = walkRightImg[0]
        self.animationImages = walkRightImg
        self.animationDuration = 0.8 / 2
        self.animationRepeatCount = 2
    }
    
    func walkLeft() {
        self.image = self.walkLeftImg[0]
        self.animationImages = walkLeftImg
        self.startAnimating()
        
        UIView.animate(withDuration: 0.8, delay: 0, options: .curveEaseOut, animations: {
            if Double(self.center.x) + self.step < self.iceBergLeftBound{
                self.center.x += CGFloat(self.step)
            }
        }, completion: nil)
    }
    
    func dizzySwim() {
        self.image = self.dizzyImg[1]
        self.animationImages = self.dizzyImg
        self.animationRepeatCount = 10
        self.startAnimating()
        
        let animation = CABasicAnimation(keyPath: "transform")
        animation.fromValue = NSValue(caTransform3D: CATransform3DMakeRotation(CGFloat(Measurement(value: 30, unit: UnitAngle.degrees).converted(to: .radians).value), 0, 0.0, 1.0))
        animation.toValue = NSValue(caTransform3D: CATransform3DMakeRotation(CGFloat(Measurement(value: -30, unit: UnitAngle.degrees).converted(to: .radians).value), 0, 0.0, 1.0))
        animation.duration = 0.2
        animation.repeatCount = 10
        animation.autoreverses = true
        self.layer.add(animation, forKey: nil)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
            self.layer.removeAllAnimations()
            self.animationRepeatCount = 2
        }
    }
    
    func walkRight() {
        self.image = self.walkRightImg[0]
        self.animationImages = walkRightImg
        self.startAnimating()
        UIView.animate(withDuration: 0.8, delay: 0, options: .curveEaseOut, animations: {
            if Double(self.center.x) + self.step < self.iceBergLeftBound{
                self.center.x += CGFloat(self.step)
            }
        }, completion: nil)
    }
    
    
    
    func swipeLeft(_ recognizer: UISwipeGestureRecognizerDirection){
        walkLeft()
    }
    
    func swipeRight(_ recognizer: UISwipeGestureRecognizerDirection){
        walkRight()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
