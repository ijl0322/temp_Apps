//
//  ViewController.swift
//  Photo Phabulous
//
//  Created by Isabel  Lee on 20/02/2017.
//  Copyright © 2017 Isabel  Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    
    // MARK: Variables
    
    //var imageArray = [UIImage(named: "img1"), UIImage(named: "img2"), UIImage(named: "img3"), UIImage(named: "img4"), UIImage(named: "img5")]
    var imageArray : [UIImage] = []
    
    var imageUrl: [String] = []
    
    var imageCount = 0
    
    var newImage: UIImage?
    
    var selectedImage: UIImage?
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: Properties

    @IBAction func Refresh(_ sender: UIButton) {
        SharedNetworking.sharedInstance.loadData(completion: { (imgUrl) in
            if let imgUrl = imgUrl {
                self.imageUrl = imgUrl
                dump(self.imageUrl)
                for url in self.imageUrl {
                    SharedNetworking.sharedInstance.downloadPhoto(imgUrl: url, completion: { (img) in
                        if let newImage = img {
                            self.imageArray.append(newImage)
                        }
                    })
                }
                self.imageCount = self.imageArray.count
                self.collectionView.reloadData()
            }
        })
        
    }
    @IBAction func camera(_ sender: UIBarButtonItem) {
        launchPhotoPicker()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        

        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "collectionCell")
        collectionView.dataSource = self
        collectionView.delegate = self
        
        SharedNetworking.sharedInstance.loadData(completion: { (imgUrl) in
            if let imgUrl = imgUrl {
                print("doing this second")
                self.imageUrl = imgUrl
                dump(self.imageUrl)
                for url in self.imageUrl {
                    SharedNetworking.sharedInstance.downloadPhoto(imgUrl: url, completion: { (img) in
                        if let newImage = img {
                            self.imageArray.append(newImage)
                        }
                    })
                }
                self.imageCount = self.imageArray.count
                self.collectionView.reloadData()
            }
        })
        
        // Do any additional setup after loading the view, typically from a nib.
    }
        
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage{
            newImage = pickedImage
            addImage()
            
        } else {
            print("Error adding image")
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    func launchPhotoPicker() {
        let alert = UIAlertController(title: "Get photos from:", message: "Get photos from:", preferredStyle: UIAlertControllerStyle.alert)
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = false
        
        alert.addAction(UIAlertAction(title: "Take a Photo", style: UIAlertActionStyle.default, handler: { (action) in
            print("camera")
            self.dismiss(animated: true, completion: nil)
            imagePicker.sourceType = UIImagePickerControllerSourceType.camera
            self.present(imagePicker, animated: true){
                
            }
        }))
        
        alert.addAction(UIAlertAction(title: "Use photo library", style: UIAlertActionStyle.default, handler: { (action) in
            print("library")
            self.dismiss(animated: true, completion: nil)
            imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
            self.present(imagePicker, animated: true){
                
            }
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func addImage(){
        imageArray.append(newImage!)
        let index = imageArray.index(where : {$0 == newImage})
        let indexPath = IndexPath(item: index!, section: 0)
        self.collectionView.performBatchUpdates({Void in
            self.collectionView.insertItems(at: [indexPath])
            self.imageCount += 1
        }, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailViewSegue"{
            let vc = segue.destination as! ImageViewController
            vc.image = selectedImage
        }
    }
}


extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! CollectionViewCell
        cell.awakeFromNib()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let imageCell = cell as! CollectionViewCell
        imageCell.imageView.image = imageArray[indexPath.row]
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width/4, height: view.frame.width/4)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
        selectedImage = imageArray[indexPath.row]
        self.performSegue(withIdentifier: "detailViewSegue", sender: Any?.self)
        
    }
}

