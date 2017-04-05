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
    func createImage() -> Void
}

enum collectionViewItems {
    case create
    case sticker(MSSticker)
}

class smallViewController: UIViewController {
    
    var stickers = [collectionViewItems]()
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
        stickers.insert(.create, at: 0)
        dump(stickers)
    }
    
    func loadStickers() {
        createSticker(asset: "26", localizedDescription: "Annoyed By the rain")
        createSticker(asset: "1", localizedDescription: "Laugh")

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
            stickers.append(.sticker(sticker))
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
        
        let item = stickers[indexPath.row]
        switch item {
        case .sticker(let sticker):
            return dequeueStickerCell(at: indexPath, for: sticker)
        case .create:
            return dequeueCreateCell(at: indexPath)
        }
    }
    
    
    func dequeueCreateCell(at indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "createCell", for: indexPath) as! CreateCell
        return cell
        
    }
    
    func dequeueStickerCell(at indexPath: IndexPath, for sticker: MSSticker) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "stickerCell", for: indexPath) as! CollectionViewCell
        cell.sticker.sticker = sticker
        return cell
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Sticker #\(indexPath.row) Chosen")
        let item = stickers[indexPath.row]
        switch item {
            case .create:
                delegate?.createImage()
            default:
                return
        }
        
        
    }

}
