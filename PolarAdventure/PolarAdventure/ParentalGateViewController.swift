//
//  ParentalGateViewController.swift
//  PolarAdventure
//
//  Created by Isabel  Lee on 04/04/2017.
//  Copyright © 2017 Isabel  Lee. All rights reserved.
//

import UIKit

class ParentalGateViewController: UIViewController, UIGestureRecognizerDelegate {
    
    
    //MARK: Variables
    
    let Bounds = Size()
    var screenWidth: Double = 0
    var screenHeight: Double = 0
    var iceWidth = 0.0
    var iceHeight = 0.0
    var iceSpacing = 0.0
    var iceYPosition = 0.0
    var penguinYPosition = 0.0
    var penguinSpacing = 0.0
    var penguinLeading = 0.0
    var penguinSize = 0.0
    var iceTriangle: UIImageView?
    var iceCircle: UIImageView?
    var iceHexagon: UIImageView?
    var penguinOne: UIImageView?
    var penguinTwo: UIImageView?
    var penguinThree: UIImageView?
    var penguinOneFrame: CGRect?
    var penguinTwoFrame: CGRect?
    var penguinThreeFrame: CGRect?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpIce()
        setUpPenguins()
    }

    

    //MARK: Set Up
    
    private func setUpIce() {
        screenWidth = Bounds.screenWidth
        screenHeight = Bounds.screenHeight
        iceWidth = screenWidth * 0.25
        iceHeight = iceWidth/2
        iceSpacing = screenWidth * 0.0625
        iceYPosition = screenHeight * 0.3
        
        iceCircle = UIImageView(frame: CGRect(x: iceSpacing, y: iceYPosition, width: iceWidth, height: iceHeight))
        iceHexagon = UIImageView(frame: CGRect(x: iceSpacing*2 + iceWidth*1, y: iceYPosition, width: iceWidth, height: iceHeight))
        iceTriangle = UIImageView(frame: CGRect(x: iceSpacing*3 + iceWidth*2, y: iceYPosition, width: iceWidth, height: iceHeight))
        
        iceCircle?.image = UIImage(named: "ice_circle")
        iceTriangle?.image = UIImage(named: "ice_triangle")
        iceHexagon?.image = UIImage(named: "ice_hexagon")
        
        iceCircle?.isUserInteractionEnabled = true
        iceTriangle?.isUserInteractionEnabled = true
        iceHexagon?.isUserInteractionEnabled = true
        
        self.view.addSubview(iceTriangle!)
        self.view.addSubview(iceCircle!)
        self.view.addSubview(iceHexagon!)
    }
    
    private func setUpPenguins() {
        penguinSize = screenWidth * 0.2
        penguinLeading = screenWidth * 0.15
        penguinSpacing = screenWidth * 0.05
        penguinYPosition = screenHeight * 0.8
        
        penguinOneFrame = CGRect(x: penguinLeading, y: penguinYPosition, width: penguinSize, height: penguinSize)
        penguinTwoFrame = CGRect(x: penguinLeading + penguinSize + penguinSpacing, y: penguinYPosition, width: penguinSize, height: penguinSize)
        penguinThreeFrame = CGRect(x: penguinLeading + penguinSize*2 + penguinSpacing*2, y: penguinYPosition, width: penguinSize, height: penguinSize)
        
        penguinOne = UIImageView(frame: penguinOneFrame!)
        penguinTwo = UIImageView(frame: penguinTwoFrame!)
        penguinThree = UIImageView(frame: penguinThreeFrame!)
        
        penguinOne?.contentMode = .scaleAspectFit
        penguinTwo?.contentMode = .scaleAspectFit
        penguinThree?.contentMode = .scaleAspectFit
        
        penguinOne?.tag = 1
        penguinTwo?.tag = 2
        penguinThree?.tag = 3
        
        penguinOne?.isUserInteractionEnabled = true
        penguinTwo?.isUserInteractionEnabled = true
        penguinThree?.isUserInteractionEnabled = true
        
        penguinOne?.image = UIImage(named: "penguin_walk1")
        penguinTwo?.image = UIImage(named: "penguin_walk1")
        penguinThree?.image = UIImage(named: "penguin_walk1")
        
        for penguin in [penguinOne!, penguinTwo!, penguinThree!] {
            let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(self.handlePan(_:)))
            panGestureRecognizer.delegate = self
            penguin.addGestureRecognizer(panGestureRecognizer)
        }
    
        self.view.addSubview(penguinOne!)
        self.view.addSubview(penguinTwo!)
        self.view.addSubview(penguinThree!)
    }
    
    
    
    func handlePan(_ recognizer: UIPanGestureRecognizer) {
        let translation = recognizer.translation(in: recognizer.view)
        
        if let view = recognizer.view {
            view.center = CGPoint(x:view.center.x + translation.x,
                                  y:view.center.y + translation.y)
        }
        
        recognizer.setTranslation(CGPoint.zero, in: recognizer.view)
        
        guard let penguin = recognizer.view else {
            print("Cannot unwrap penguin")
            return
        }
        
        if recognizer.state == UIGestureRecognizerState.ended {
            
            switch penguin.tag {
            case 1:
                penguin.frame = penguinOneFrame!
                print("Wrong penguin")
                return
            case 3:
                penguin.frame = penguinThreeFrame!
                print("Wrong penguin")
                return
            case 2:
                if (penguin.frame).intersects(iceHexagon!.frame.insetBy(dx: 40.0, dy: 40.0)) {
                    print("OK")
                    penguin.center.x = iceHexagon!.center.x + 10
                    penguin.center.y = iceHexagon!.center.y - 40
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        self.showAuthorInfo()
                    }
                    return
                    
                } else {
                    print("Wrong Ice")
                    penguin.frame = penguinTwoFrame!
                    return
                }
            default:
                return
            }
        }
    }
    
    func showAuthorInfo() {
        let vc = AuthorInfoViewController()
        self.present(vc, animated: true) {
            print("Author Info presented")
        }
    }
}
