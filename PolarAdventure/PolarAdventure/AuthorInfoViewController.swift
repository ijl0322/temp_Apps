//
//  AuthorInfoViewController.swift
//  PolarAdventure
//
//  Created by Isabel  Lee on 05/04/2017.
//  Copyright © 2017 Isabel  Lee. All rights reserved.
//

import UIKit

class AuthorInfoViewController: UIViewController {
    
    
    @IBAction func tapToDismiss(_ sender: UIButton) {
        self.dismiss(animated: true) {
            print("Dismiss Author Page")
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



}
