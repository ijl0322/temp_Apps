//
//  ParentalGateViewController.swift
//  PolarAdventure
//
//  Created by Isabel  Lee on 04/04/2017.
//  Copyright © 2017 Isabel  Lee. All rights reserved.
//

import UIKit

class ParentalGateViewController: UIViewController {
    
    
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
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    //MARK: Set Up
    
    private func setUp() {
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
        
        self.view.addSubview(iceTriangle!)
        self.view.addSubview(iceCircle!)
        self.view.addSubview(iceHexagon!)
        
        
        penguinSize = screenWidth * 0.2
        penguinLeading = screenWidth * 0.15
        penguinSpacing = screenWidth * 0.05
        penguinYPosition = screenHeight * 0.8
        
        penguinOne = UIImageView(frame: CGRect(x: penguinLeading, y: penguinYPosition, width: penguinSize, height: penguinSize))
        penguinTwo = UIImageView(frame: CGRect(x: penguinLeading + penguinSize + penguinSpacing, y: penguinYPosition, width: penguinSize, height: penguinSize))
        penguinThree = UIImageView(frame: CGRect(x: penguinLeading + penguinSize*2 + penguinSpacing*2, y: penguinYPosition, width: penguinSize, height: penguinSize))
        
        penguinOne?.contentMode = .scaleAspectFit
        penguinTwo?.contentMode = .scaleAspectFit
        penguinThree?.contentMode = .scaleAspectFit
        
        penguinOne?.image = UIImage(named: "penguin_walk1")
        penguinTwo?.image = UIImage(named: "penguin_walk1")
        penguinThree?.image = UIImage(named: "penguin_walk1")
        
        self.view.addSubview(penguinOne!)
        self.view.addSubview(penguinTwo!)
        self.view.addSubview(penguinThree!)
    }
}
