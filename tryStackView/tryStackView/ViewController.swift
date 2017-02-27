//
//  ViewController.swift
//  tryStackView
//
//  Created by Isabel  Lee on 26/02/2017.
//  Copyright © 2017 Isabel  Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myView: UIStackView!
    @IBOutlet weak var greenView: UIView!
    @IBAction func hideView(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5){
            self.greenView.isHidden = !self.greenView.isHidden
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

