//
//  ViewController.swift
//  testShopAndLinguisticTrigger
//
//  Created by Isabel  Lee on 20/04/2017.
//  Copyright © 2017 isabeljlee. All rights reserved.
//  https://www.hackingwithswift.com/example-code/strings/how-to-parse-a-sentence-using-nslinguistictagger
//  https://www.youtube.com/watch?v=kmopFjnKhGQ&t=682s
import UIKit
import StoreKit

class ViewController: UIViewController, SKStoreProductViewControllerDelegate {

    @IBAction func buy(_ sender: UIButton) {
        print("button clicked")
        let store = SKStoreProductViewController()
        store.delegate = self
        let param = [SKStoreProductParameterITunesItemIdentifier: NSNumber(value:364709193)]
        store.loadProduct(withParameters: param, completionBlock: {
            (success, error) -> Void in
            
            print("inside completion block")
            if success == true{
                self.present(store, animated: true, completion: nil)
                print("succes")
            }
            else{
                print("error")
            }
            
        })
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let options = NSLinguisticTagger.Options.omitWhitespace.rawValue | NSLinguisticTagger.Options.joinNames.rawValue
        let tagger = NSLinguisticTagger(tagSchemes: NSLinguisticTagger.availableTagSchemes(forLanguage: "en"), options: Int(options))
        
        let inputString = "This is a very long test for you to try"
        tagger.string = inputString
        
        let range = NSRange(location: 0, length: inputString.utf16.count)
        tagger.enumerateTags(in: range, scheme: NSLinguisticTagSchemeNameTypeOrLexicalClass, options: NSLinguisticTagger.Options(rawValue: options)) { tag, tokenRange, sentenceRange, stop in
            let token = (inputString as NSString).substring(with: tokenRange)
            print("\(tag): \(token)")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func productViewControllerDidFinish(_ viewController: SKStoreProductViewController) {
        self.dismiss(animated: true, completion: nil)
    }
}


