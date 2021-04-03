//
//  PinterestCell.swift
//  CustomCollectionViewLayout
//
//  Created by Nazmul Islam on 3/4/21.
//

import UIKit

class PinterestCell: UICollectionViewCell {

    @IBOutlet weak var cellContainerView: UIView!

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var annotationContainerView: UIView!
    
    @IBOutlet weak var imageViewHeightLC: NSLayoutConstraint!

    override func awakeFromNib() {
        super.awakeFromNib()

        setupUI()
    }

    override func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
        super.apply(layoutAttributes)

        guard let layoutAttributes = layoutAttributes as? PinterestLayoutAttributes else {
            return
        }

        imageViewHeightLC.constant = layoutAttributes.photoHeight
    }

    // MARK: - Helpers

    private func setupUI() {
        cellContainerView.clipsToBounds = true
        cellContainerView.layer.cornerRadius = 8
    }
}
