//
//  ImageViewController.swift
//  Bunny Cam
//
//  Created by Isabel  Lee on 25/02/2017.
//  Copyright © 2017 Isabel  Lee. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {
    
    var userImg: UIImage?
    
    @IBOutlet weak var editingImg: UIImageView!
    
    @IBOutlet weak var editingOptionView: UIView!
    @IBAction func addSticker(_ sender: UIButton) {
        if self.editingOptionView.center.y >= 793.5 {
            UIView.animate(withDuration: 0.5, animations: {
                self.editingOptionView.center.y -= self.editingOptionView.bounds.height
                print("Inside function\(self.editingOptionView.center.y)")
            })
        } else {
            UIView.animate(withDuration: 0.5, animations: {
                self.editingOptionView.center.y += self.editingOptionView.bounds.height
                print("Inside function\(self.editingOptionView.center.y)")
            })
        }

        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        if let userImg = userImg {
            editingImg.image = userImg
        }
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.isNavigationBarHidden = false
        self.editingOptionView.center.y += self.editingOptionView.bounds.height
        print("\(self.editingOptionView.center.y)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
