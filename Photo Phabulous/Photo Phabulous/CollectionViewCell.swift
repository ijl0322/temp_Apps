//
//  CollectionViewCell.swift
//  Photo Phabulous
//
//  Created by Isabel  Lee on 21/02/2017.
//  Copyright © 2017 Isabel  Lee. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    var imageView: UIImageView!
    
    override func awakeFromNib() {
        imageView = UIImageView(frame: contentView.frame)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        contentView.addSubview(imageView)
    }
}
