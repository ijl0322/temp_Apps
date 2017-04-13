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
    
    static let player = ReadToMe()
    var attributedString = NSMutableAttributedString()
    weak var textLabel: UILabel!
    var pageOneString = NSMutableAttributedString()
    var pageTwoString = NSMutableAttributedString()
    var pageThreeString = NSMutableAttributedString()
    var pageFourString = NSMutableAttributedString()
    var pageFiveString = NSMutableAttributedString()
    var pageSixString = NSMutableAttributedString()
    var pageSevenString = NSMutableAttributedString()
    let blue = UIColor(red: 1/255, green: 64/255, blue: 140/255, alpha: 1)
    
    
    private init(){
        setUP()
    }
    
    
    func pageOne(storyLabel: UILabel) {
        let path = Bundle.main.path(forResource: "page1", ofType:"plist")
        let timer = NSArray(contentsOfFile:path!) as! [[String : Any]]
        attributedString = pageOneString
        SharedAudioPlayer.player.play(name: "page1")
        setTimer(timer: timer)
        textLabel = storyLabel
    }
    
    func pageTwo(storyLabel: UILabel) {
        let path = Bundle.main.path(forResource: "test", ofType:"plist")
        let timer = NSArray(contentsOfFile:path!) as! [[String : Any]]
        attributedString = pageTwoString
        SharedAudioPlayer.player.play(name: "page2")
        setTimer(timer: timer)
        textLabel = storyLabel
    }
    
    func pageThree(storyLabel: UILabel) {
        let path = Bundle.main.path(forResource: "page3", ofType:"plist")
        let timer = NSArray(contentsOfFile:path!) as! [[String : Any]]
        attributedString = pageThreeString
        SharedAudioPlayer.player.play(name: "page3")
        setTimer(timer: timer)
        textLabel = storyLabel
    }
    
    func pageFour(storyLabel: UILabel) {
        let path = Bundle.main.path(forResource: "page4", ofType:"plist")
        let timer = NSArray(contentsOfFile:path!) as! [[String : Any]]
        attributedString = pageFourString
        SharedAudioPlayer.player.play(name: "page4")
        setTimer(timer: timer)
        textLabel = storyLabel
    }
    
    func pageFive(storyLabel: UILabel) {
        let path = Bundle.main.path(forResource: "page5", ofType:"plist")
        let timer = NSArray(contentsOfFile:path!) as! [[String : Any]]
        attributedString = pageFiveString
        SharedAudioPlayer.player.play(name: "page5")
        setTimer(timer: timer)
        textLabel = storyLabel
    }
    
    func pageSix(storyLabel: UILabel) {
        let path = Bundle.main.path(forResource: "page6", ofType:"plist")
        let timer = NSArray(contentsOfFile:path!) as! [[String : Any]]
        attributedString = pageSixString
        SharedAudioPlayer.player.play(name: "page6")
        setTimer(timer: timer)
        textLabel = storyLabel
    }

    func pageSeven(storyLabel: UILabel) {
        let path = Bundle.main.path(forResource: "page7", ofType:"plist")
        let timer = NSArray(contentsOfFile:path!) as! [[String : Any]]
        attributedString = pageSevenString
        SharedAudioPlayer.player.play(name: "page7")
        setTimer(timer: timer)
        textLabel = storyLabel
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
        
        attributedString.addAttribute(NSForegroundColorAttributeName,
                                      value: blue,
                                      range: NSRange(location: 0, length: attributedString.length))
        
        attributedString.addAttribute(NSBackgroundColorAttributeName,
                                      value: blue,
                                      range: NSRange(location: range[0], length: range[1]))
        
        attributedString.addAttribute(NSForegroundColorAttributeName,
                     value: UIColor.white,
                     range: NSRange(location: range[0], length: range[1]))
        
        textLabel.attributedText = attributedString
    }
    
    func setUP() {
        let text1 = "A baby penguin got separated from his family during a severe snowstorm, and was all alone on a tiny iceberg. Everyday, he would walk around on the iceberg, wondering if he should go find his family, but he was too scared to go alone.                 "
        
        pageOneString = formateString(text: text1)
        
        let text2 = "One day, the penguin was standing on the edge of the iceberg, watching some little fish swim by, when he noticed something different. It was a shark!"
        pageTwoString = formateString(text: text2)
        
        let text3 = "Suddenly, the shark hit the iceberg! Poor little penguin was so scared!"
        pageThreeString = formateString(text: text3)
        
        let text4 = "It accidently fell into the water! Oh no! But the shark was very kind, and wanted to help. "
        pageFourString = formateString(text: text4)
        
        let text5 = "The penguin was very thankful that the shark saved him! I'm sorry I scared you, said the shark, I'm nearsighted and I can't see things clearly. "
        pageFiveString = formateString(text: text5)
        
        let text6 = "The penguin told the shark how he lost his family. And the shark decided to help the penguin find his family!"
        pageSixString = formateString(text: text6)
        
        let text7 = "With new friends, they will now set off on a brand new adventure!  "
        pageSevenString = formateString(text: text7)
    }
    
    func formateString(text: String) -> NSMutableAttributedString {
        let formattedString = NSMutableAttributedString(string: text,
                                                        attributes: [NSFontAttributeName: UIFont(name: "ChalkboardSE-Regular",
                                                        size: 25.0)!])
        formattedString.addAttribute(NSForegroundColorAttributeName,
                                     value: blue,
                                     range: NSRange(location: 0, length: formattedString.length))
        return formattedString
    }
}
