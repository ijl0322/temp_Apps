//
//  ViewController.swift
//  UiDynamicTest
//
//  Created by Isabel  Lee on 11/04/2017.
//  Copyright © 2017 isabeljlee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var testLabel: UILabel!
    
    let penguin = UIImageView(frame: CGRect(x: 300, y: 400, width: 100, height: 100))
    var animator:UIDynamicAnimator!
    var gravity:UIGravityBehavior!
    var collision:UICollisionBehavior!
    var push: UIPushBehavior!
    let penguin_jump = [UIImage(named: "penguin_slide1")!, UIImage(named: "penguin_up")!]
    var attributedString = NSMutableAttributedString()
    var timer: [[String: Any]] = []

    
    @IBAction func myButton(_ sender: UIButton) {

//        UIView.animate(withDuration: 1, animations: {
//            self.penguin.center.x = 700
//            self.penguin.center.y = 300
//            self.penguin.transform = CGAffineTransform(rotationAngle: (150.0 * CGFloat(Double.pi)) / 180.0)
//        }, completion: { (finish) in
//        
//            self.animator = UIDynamicAnimator(referenceView: self.view)
//            self.gravity = UIGravityBehavior(items: [self.penguin])
//            self.animator.addBehavior(self.gravity)
//            
//            self.collision = UICollisionBehavior(items: [self.penguin])
//            self.collision.translatesReferenceBoundsIntoBoundary = true
//            self.animator.addBehavior(self.collision)
//            
//            self.push = UIPushBehavior(items: [self.penguin], mode: .instantaneous)
//            self.push.pushDirection = CGVector(dx: 15, dy: 35)
//            self.animator.addBehavior(self.push)
//            
//            let itemBehaviour = UIDynamicItemBehavior(items: [self.penguin])
//            itemBehaviour.resistance = 8
//            self.animator.addBehavior(itemBehaviour)
//            
//            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
//                self.animator.removeBehavior(self.gravity)
//                self.animator.removeBehavior(self.collision)
//                self.animator.removeBehavior(self.push)
//            }
//        })
//        
        
        let readToMe = ReadToMe()
        readToMe.pageOne(storyLabel: testLabel)        

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let path = Bundle.main.path(forResource: "test", ofType:"plist")
        timer = NSArray(contentsOfFile:path!) as! [[String : Any]]
        
        
    
        self.penguin.image = UIImage(named: "penguin_slide1")
        let text = "One day, the penguin was standing on the edge of the iceberg, watching some little fish swim by, when he noticed something different. It was a shark!                 "
        
        
        attributedString = NSMutableAttributedString(string: text,
                                                     attributes: [NSFontAttributeName: UIFont(name: "ChalkboardSE-Regular",
                                                     size: 10.0)!])
        testLabel.attributedText = attributedString
        
        
        self.view.addSubview(penguin)
        
    }
    
}

