//
//  PinterestVC.swift
//  CustomCollectionViewLayout
//
//  Created by Nazmul Islam on 3/4/21.
//

import UIKit

class CollectionVC: UICollectionViewController {
    static let cellReueseIdentifier = "CELL_REUSE_IDENTIFIER"

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.backgroundColor = .white

        // register cell
        collectionView.register(
            UICollectionViewCell.self,
            forCellWithReuseIdentifier: CollectionVC.cellReueseIdentifier
        )
    }

    override func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return 100
    }

    override func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CollectionVC.cellReueseIdentifier,
            for: indexPath
        )
        cell.backgroundColor = .random
        return cell
    }
}
