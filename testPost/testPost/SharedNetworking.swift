//
//  SharedNetworking.swift
//  testPost
//
//  Created by Isabel  Lee on 22/02/2017.
//  Copyright © 2017 Isabel  Lee. All rights reserved.
//

import Foundation

import Foundation
import UIKit

class SharedNetworking {
    static let sharedInstance = SharedNetworking()
    private init() {}
    
    var imageUrl : [String]? = []
    let session = URLSession.shared
    
    func loadData(completion: @escaping (([String]?)->Void)){
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        imageUrl = []
        
        let urlString = "http://stachesandglasses.appspot.com/user/ijlee/json/"
        
        
        guard let url = NSURL(string: urlString) else {
            imageUrl = nil
            completion(self.imageUrl)
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            return
        }
        
        let task = session.dataTask(with: url as URL, completionHandler: { (data, response, error) -> Void in
            
            guard error == nil else {
                print("error: \(error!.localizedDescription)")
                self.imageUrl = nil
                completion(self.imageUrl)
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
                return
            }
            
            guard let data = data else {
                self.imageUrl = nil
                completion(self.imageUrl)
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
                return
            }
            
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                guard let issues = json as? [String: AnyObject] else {
                    self.imageUrl = nil
                    completion(self.imageUrl)
                    UIApplication.shared.isNetworkActivityIndicatorVisible = false
                    return
                }
                
                let RelatedTopics = issues["results"] as! Array<Dictionary<String, AnyObject>>
                for topic in RelatedTopics {
                    let url = topic["image_url"] as! String
                    self.imageUrl!.append(url)
                }
                
            } catch {
                print("error serializing JSON: \(error)")
            }
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            completion(self.imageUrl)
        })
        
        task.resume()
    }
}



