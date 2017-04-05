//
//  Size.swift
//  PolarAdventure
//
//  Created by Isabel  Lee on 04/04/2017.
//  Copyright © 2017 Isabel  Lee. All rights reserved.
//

import UIKit
class Size {
    
    let screenBounds = UIScreen.main.bounds
    let screenWidth: Double
    let screenHeight: Double
    init() {
        screenWidth = Double(screenBounds.width)
        screenHeight = Double(screenBounds.height)
    }
}
