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
    var timer: [[String: Any]] = [["word":"One", "Start": 0.0], ["word":"day,", "Start": 0.9364], ["word":"the", "Start":1.5098], ["word":"penguin", "Start":2.044], ["word":"was", "Start":2.599], ["word":"standing", "Start":2.8858], ["word":"on", "Start":3.4209], ["word":"the", "Start":3.6066], ["word":"edge", "Start":3.7583], ["word":"of", "Start":3.9561], ["word":"the", "Start":4.13417], ["word":"iceBerg", "Start":4.3187]]

    
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
        
        SharedAudioPlayer.player.playNote(name: "page2")
        setTimer()
        //updateAttributedString(startIndex: 4, length: 3)
        testLabel.attributedText = attributedString
        

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let path = Bundle.main.path(forResource: "QuickBrown", ofType:"plist")
        let dict = NSArray(contentsOfFile:path!)
        
        dump(dict)
        self.penguin.image = UIImage(named: "penguin_slide1")
        let text = "One day, the penguin was standing on the edge of the iceberg, watching some little fish"
        
        
        attributedString = NSMutableAttributedString(string: text,
                                                     attributes: [NSFontAttributeName: UIFont(name: "ChalkboardSE-Regular",
                                                     size: 30.0)!])
        //updateAttributedString(startIndex: 0, length: 3)
        
        
        self.view.addSubview(penguin)
        
    }
    
    func updateAttributedString(_ timer: Timer) {
        let range = timer.userInfo as! [Int]
        
        attributedString.addAttribute(NSBackgroundColorAttributeName,
                                      value: UIColor.clear,
                                      range: NSRange(location: 0, length: attributedString.length))
        
        attributedString.addAttribute(NSBackgroundColorAttributeName,
                                      value: UIColor.yellow,
                                      range: NSRange(location: range[0], length: range[1]))
        testLabel.attributedText = attributedString
    }

    func setTimer() {
        var startIndex = 0
        for i in 0..<timer.count{
            print("\(String(describing: timer[i]["word"]))")
            let word = timer[i]["word"] as! String
            let time = timer[i]["Start"] as! Double
            let length = word.characters.count
            Timer.scheduledTimer(timeInterval: time, target: self, selector: #selector(updateAttributedString(_:)), userInfo: [startIndex, length], repeats: false)
            startIndex += length + 1
        }
    }


}

