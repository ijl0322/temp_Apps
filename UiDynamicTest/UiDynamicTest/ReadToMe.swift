//
//  ReadToMe.swift
//  UiDynamicTest
//
//  Created by Isabel  Lee on 11/04/2017.
//  Copyright © 2017 isabeljlee. All rights reserved.
//

import Foundation
import UIKit

class ReadToMe {
    var attributedString = NSMutableAttributedString()
    weak var testLabel: UILabel!
    
    func pageOne(storyLabel: UILabel) {
        let path = Bundle.main.path(forResource: "test", ofType:"plist")
        let timer = NSArray(contentsOfFile:path!) as! [[String : Any]]
        let text = "One day, the penguin was standing on the edge of the iceberg, watching some little fish swim by, when he noticed something different. It was a shark!                 "
        
        
        attributedString = NSMutableAttributedString(string: text,
                                                     attributes: [NSFontAttributeName: UIFont(name: "ChalkboardSE-Regular",
                                                     size: 10.0)!])
        SharedAudioPlayer.player.playNote(name: "page2")
        setTimer(timer: timer)
        testLabel = storyLabel
    }
    
    func setTimer(timer: [[String: Any]]) {
        var startIndex = 0
        for i in 0..<timer.count{
            print("\(String(describing: timer[i]["word"]))")
            let word = timer[i]["word"] as! String
            let time = timer[i]["start"] as! Double
            let length = word.characters.count
            Timer.scheduledTimer(timeInterval: time, target: self, selector: #selector(updateAttributedString(_:)), userInfo: [startIndex, length], repeats: false)
            startIndex += length + 1
        }
    }
    
    @objc func updateAttributedString(_ timer: Timer) {
        let range = timer.userInfo as! [Int]
        
        attributedString.addAttribute(NSBackgroundColorAttributeName,
                                      value: UIColor.clear,
                                      range: NSRange(location: 0, length: attributedString.length))
        
        attributedString.addAttribute(NSBackgroundColorAttributeName,
                                      value: UIColor.yellow,
                                      range: NSRange(location: range[0], length: range[1]))
        testLabel.attributedText = attributedString
    }
}
