//
//  ViewController.swift
//  tryStackView
//
//  Created by Isabel  Lee on 26/02/2017.
//  Copyright © 2017 Isabel  Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var addStickerView: UIView!
    @IBOutlet weak var myView: UIStackView!

    @IBOutlet weak var addTextView: UIView!

    
    

    @IBAction func addText(_ sender: UIButton) {
        if self.addTextView.isHidden {
            UIView.animate(withDuration: 0.5){

                self.addStickerView.isHidden = false
            }
        } else {
            
            self.addTextView.isHidden = true
            self.addStickerView.isHidden = false
        }
    }
    
    @IBAction func addSticker(_ sender: UIButton) {
        
        if self.addStickerView.isHidden {
            UIView.animate(withDuration: 0.5){

                self.addTextView.isHidden = false
            }
        } else {
            
            self.addStickerView.isHidden = true
            self.addTextView.isHidden = false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

