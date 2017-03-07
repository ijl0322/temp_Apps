//
//  smallView.swift
//  testImessage
//
//  Created by Isabel  Lee on 05/03/2017.
//  Copyright © 2017 Isabel  Lee. All rights reserved.
//


import UIKit
import Messages

protocol smallViewDelegate: class {
    func sendImage(img: UIImage) -> Void
}

enum collectionViewItems {
    case create
    case sticker(MSSticker)
}

class smallViewController: UIViewController {
    
    let stickersArray = [UIImage(named: "26")]
    var stickers = [MSSticker]()
    
    weak var delegate: smallViewDelegate?
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBAction func button(_ sender: Any) {
        
        delegate?.sendImage(img: UIImage(named: "26")!)
        
        
    }
    override func viewDidLoad() {
        //collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "stickerCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        loadStickers()
        dump(stickers)
    }
    
    func loadStickers() {
        createSticker(asset: "26", localizedDescription: "Annoyed By the rain")

    }
    
    func createSticker(asset: String, localizedDescription: String) {
        guard let stickerPath = Bundle.main.path(forResource: asset, ofType: "png") else {
            print("couldn't create the sticker path for ", asset)
            return
        }
        let stickerURL = URL(fileURLWithPath: stickerPath)
        
        let sticker: MSSticker
        do {
            try sticker = MSSticker(contentsOfFileURL: stickerURL, localizedDescription: localizedDescription)
            stickers.append(sticker)
        } catch {
            print(error)
            return
        }
    }
    
}

extension smallViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return stickers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "stickerCell", for: indexPath) as! CollectionViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let imageCell = cell as! CollectionViewCell
        //imageCell.stickerImage.image = stickersArray[indexPath.row]
        imageCell.sticker.sticker = stickers[indexPath.row]
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Sticker #\(indexPath.row) Chosen")
        
    }

}
