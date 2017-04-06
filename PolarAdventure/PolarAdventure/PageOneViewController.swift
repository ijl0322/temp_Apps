//
//  PageOneViewController.swift
//  PolarAdventure
//
//  Created by Isabel  Lee on 05/04/2017.
//  Copyright © 2017 Isabel  Lee. All rights reserved.
//  Attribution: http://stackoverflow.com/questions/990221/multiple-lines-of-text-in-uilabel

import UIKit

class PageOneViewController: UIViewController {
    
    let bounds = Size()
    var screenWidth = 0.0
    var screenHeight = 0.0
    var storyLineLength = 0.0
    var storyLineXPosition = 0.0
    var story: UILabel?
    var penguin = PenguinWalk()
    
    @IBAction func walkRight(_ sender: UIButton) {
        penguin.walkRight()
    }
    
    @IBAction func walk(_ sender: UIButton) {
        penguin.walkLeft()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        screenWidth = bounds.screenWidth
        screenHeight = bounds.screenHeight
        storyLineLength = screenWidth*0.8
        storyLineXPosition = screenWidth*0.1
        story = UILabel(frame: CGRect(x: storyLineXPosition, y: 100, width: storyLineLength, height: 150))
        
        story?.text = "a            very             long                  text            for        the              story        testing              a            very             long                  text            for        the              story        testing            a            very             long                  text            for        the              story        testing"
        
        story?.lineBreakMode = .byWordWrapping
        story?.numberOfLines = 0
        self.view.addSubview(story!)
        self.view.addSubview(penguin)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)

    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
