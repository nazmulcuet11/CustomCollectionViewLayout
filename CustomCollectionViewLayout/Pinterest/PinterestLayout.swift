//
//  PinterestLayout.swift
//  CustomCollectionViewLayout
//
//  Created by Nazmul Islam on 3/4/21.
//

import UIKit

protocol PinterestLayoutDelegate: class {
    func collectionView(
        _ collectionView: UICollectionView,
        heightForPhotoAt indexPath: IndexPath,
        with width: CGFloat
    ) -> CGFloat

    func collectionView(
        _ collectionView: UICollectionView,
        heightForAnnotationAt indexPath: IndexPath,
        with width: CGFloat
    ) -> CGFloat
}

class PinterestLayout: UICollectionViewLayout {
    weak var delegate: PinterestLayoutDelegate?

    private let numberOfColums = 2
    private let cellInset: CGFloat = 2
    private var cache = [PinterestLayoutAttributes]()

    private var contentWidth: CGFloat {
        collectionView?.bounds.width ?? 0
    }

    private var contentHeight: CGFloat = 0

    override var collectionViewContentSize: CGSize {
        return CGSize(width: contentWidth, height: contentHeight)
    }

    override class var layoutAttributesClass: AnyClass {
        return PinterestLayoutAttributes.self
    }

    override func prepare() {
        guard cache.isEmpty,
              let collectionView = collectionView,
              let delegate = delegate
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

            let width = columnWidth - (cellInset * 2)
            let photoHeight = delegate.collectionView(
                collectionView,
                heightForPhotoAt: indexPath,
                with: width
            )
            let annotationHeight = delegate.collectionView(
                collectionView,
                heightForAnnotationAt: indexPath,
                with: width
            )
            let height = photoHeight + annotationHeight + cellInset * 2
            
            let frame = CGRect(
                x: xOffset[column],
                y: yOffset[column],
                width: columnWidth,
                height: height
            )
            let attributes = PinterestLayoutAttributes(forCellWith: indexPath)
            attributes.frame = frame.insetBy(dx: cellInset, dy: cellInset)
            attributes.photoHeight = photoHeight

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
}
