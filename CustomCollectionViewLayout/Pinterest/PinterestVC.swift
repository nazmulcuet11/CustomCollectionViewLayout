//
//  PinterestVC.swift
//  CustomCollectionViewLayout
//
//  Created by Nazmul Islam on 3/4/21.
//

import UIKit

class PinterestVC: UICollectionViewController {

    private var photoHeights = [CGFloat]()

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Pinterest"

        // Register cell classes
        let cellNib = UINib(nibName: "\(PinterestCell.self)", bundle: nil)
        collectionView.register(
            cellNib,
            forCellWithReuseIdentifier: PinterestCell.resuseId
        )

        calculateDummyPhotoHeights()
    }

    // MARK: UICollectionViewDataSource

    override func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return photoHeights.count
    }

    override func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: PinterestCell.resuseId,
            for: indexPath
        ) as! PinterestCell
        return cell
    }

    // MARK: - Helpers

    private func calculateDummyPhotoHeights() {
        let baseHeight = 120
        for _ in 0..<100 {
            let multiplier = Int.random(in: 0...3)
            let height = CGFloat(baseHeight + multiplier * 30)
            photoHeights.append(height)
        }
    }
}

extension PinterestVC: PinterestLayoutDelegate {
    func collectionView(_ collectionView: UICollectionView, heightForPhotoAt indexPath: IndexPath, with width: CGFloat) -> CGFloat {
        photoHeights[indexPath.item]
    }

    func collectionView(_ collectionView: UICollectionView, heightForAnnotationAt indexPath: IndexPath, with width: CGFloat) -> CGFloat {
        return 60
    }
}
