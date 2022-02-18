//
//  SongCell.swift
//  Sample_01
//
//  Created by ZX on 2022/2/17.
//

import UIKit

class SongCell: UICollectionViewCell {
    
    private var imageView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initializeSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func fill(with data: SongData) {
        imageView.image = data.image
    }
}

//MARK: - Private
extension SongCell {
    
    func initializeSubviews() {
        imageView = .init(frame: bounds)
        contentView.addSubview(imageView)
    }
}
