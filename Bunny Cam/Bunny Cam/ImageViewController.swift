//
//  ImageViewController.swift
//  Bunny Cam
//
//  Created by Isabel  Lee on 25/02/2017.
//  Copyright © 2017 Isabel  Lee. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {
    
    
    let lightGrey = UIColor(red: 227/255, green: 228/255, blue: 229/255, alpha: 1)
    let darkGrey = UIColor(red: 199/255, green: 200/255, blue: 201/255, alpha: 1)
    
    @IBOutlet weak var addTextButton: UIButton!
    @IBOutlet weak var addStickerButton: UIButton!
    @IBOutlet weak var addTextView: UIView!
    @IBOutlet weak var addStickerView: UIView!
    var userImg: UIImage?
    
    @IBOutlet weak var editingImg: UIImageView!
    

    @IBAction func addSticker(_ sender: UIButton) {
    
        if self.addTextView.isHidden {
            UIView.animate(withDuration: 0.5){
                
                self.addStickerView.isHidden = false
            }
        } else {
            
            self.addTextView.isHidden = true
            self.addStickerView.isHidden = false
        }
        
        addTextButton.backgroundColor = lightGrey
        addStickerButton.backgroundColor = darkGrey
    }

    @IBAction func addText(_ sender: UIButton) {
        
        if self.addStickerView.isHidden {
            UIView.animate(withDuration: 0.5){
                
                self.addTextView.isHidden = false
            }
        } else {
            
            self.addStickerView.isHidden = true
            self.addTextView.isHidden = false
        }
        
        addTextButton.backgroundColor = darkGrey
        addStickerButton.backgroundColor = lightGrey
    
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        if let userImg = userImg {
            editingImg.image = userImg
        }
        
        addTextButton.backgroundColor = lightGrey
        addStickerButton.backgroundColor = lightGrey
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.isNavigationBarHidden = false

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
