//
//  PinterestLayout.swift
//  CustomCollectionViewLayout
//
//  Created by Nazmul Islam on 3/4/21.
//

import UIKit

class PinterestLayout: UICollectionViewLayout {
    private let numberOfColums = 2
    private let cellInset: CGFloat = 2
    private var cache = [UICollectionViewLayoutAttributes]()

    private var contentWidth: CGFloat {
        collectionView?.bounds.width ?? 0
    }

    private var contentHeight: CGFloat = 0

    override var collectionViewContentSize: CGSize {
        return CGSize(width: contentWidth, height: contentHeight)
    }

    override func prepare() {
        guard cache.isEmpty,
              let collectionView = collectionView
        else {
            return
        }

        let columnWidth = contentWidth / CGFloat(numberOfColums)

        // xOffset of each column
        var xOffset = [CGFloat]()
        for column in 0..<numberOfColums {
            xOffset.append(CGFloat(column) * columnWidth)
        }

        // yOffset of each column
        var yOffset = Array<CGFloat>(repeating: 0, count: numberOfColums)

        // calculate layout attributes for each item
        var column = 0
        let numberOfItems = collectionView.numberOfItems(inSection: 0)
        for item in 0..<numberOfItems {
            let indexPath = IndexPath(item: item, section: 0)

            let height = heightForItem(at: indexPath)
            let frame = CGRect(
                x: xOffset[column],
                y: yOffset[column],
                width: columnWidth,
                height: height
            )
            let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            attributes.frame = frame.insetBy(dx: cellInset, dy: cellInset)

            cache.append(attributes)

            yOffset[column] += height

            contentHeight = max(contentHeight, yOffset[column])

            // choose to next column sequentialy
            // column = (column + 1) % numberOfColums

            // choose next column where yOffset is minimum
            column = yOffset.firstIndex(where: { $0 == yOffset.min()})!
        }
    }

    override func layoutAttributesForElements(
        in rect: CGRect
    ) -> [UICollectionViewLayoutAttributes]? {
        return cache.filter({
            rect.intersects($0.frame)
        })
    }

    override func layoutAttributesForItem(
        at indexPath: IndexPath
    ) -> UICollectionViewLayoutAttributes? {
        return cache[indexPath.item]
    }

    // MARK: - Helpers

    private func heightForItem(
        at indexPath: IndexPath
    ) -> CGFloat {
        let baseHeight = 120
        let multiplier = Int.random(in: 0...3)
        return CGFloat(baseHeight + multiplier * 30)
    }
}
