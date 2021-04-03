//
//  StickyHeadersVC.swift
//  CustomCollectionViewLayout
//
//  Created by Nazmul Islam on 3/4/21.
//

import UIKit

class StickyHeadersVC: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    var vcFactory: ViewControllerFactory!

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Sticky Headers"

        collectionView.backgroundColor = .white

        // Register cell classes
        collectionView.registerCell(UICollectionViewCell.self)
        collectionView.registerNibReusableSupplementaryView(
            StickyHeadersHeaderView.self,
            ofKind: UICollectionView.elementKindSectionHeader
        )

        if let layout = collectionViewLayout as? StickyHeadersLayout {
            layout.minimumInteritemSpacing = layout.padding
            layout.minimumLineSpacing = layout.padding

            let width = collectionView.bounds.width
            layout.headerReferenceSize = CGSize(width: width, height: 60.0)

            layout.sectionInset = UIEdgeInsets(
                top: layout.padding,
                left: 0,
                bottom: layout.padding,
                right: 0
            )

            let columWidth = width / CGFloat(layout.numberOfColums)
            let cellWidth = columWidth - (layout.padding / 2.0)
            layout.itemSize = CGSize(width: cellWidth, height: cellWidth)
        }
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(
        in collectionView: UICollectionView
    ) -> Int {
        return 10
    }


    override func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return 5
    }

    override func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(UICollectionViewCell.self, for: indexPath)
        cell.backgroundColor = .systemGray
        return cell
    }

    override func collectionView(
        _ collectionView: UICollectionView,
        viewForSupplementaryElementOfKind kind: String,
        at indexPath: IndexPath
    ) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(
            StickyHeadersHeaderView.self,
            ofKind: kind,
            for: indexPath
        )
        header.titleLabel.text = "Section \(indexPath.section + 1)"
        return header
    }
}
