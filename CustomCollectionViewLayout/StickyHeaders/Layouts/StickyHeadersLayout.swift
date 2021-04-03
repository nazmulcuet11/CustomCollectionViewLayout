//
//  StickyHeadersLayout.swift
//  CustomCollectionViewLayout
//
//  Created by Nazmul Islam on 3/4/21.
//

import UIKit

class StickyHeadersLayout: UICollectionViewFlowLayout {
    let numberOfColums = 3
    let padding: CGFloat = 2.0

    /*
    override func shouldInvalidateLayout(
        forBoundsChange newBounds: CGRect
    ) -> Bool {
        return true
    }

    override func layoutAttributesForElements(
        in rect: CGRect
    ) -> [UICollectionViewLayoutAttributes]? {
        guard let attributesList = super.layoutAttributesForElements(in: rect),
              let collectionView = collectionView
        else {
            return []
        }

        for attributes in attributesList {
            guard let kind = attributes.representedElementKind,
                  kind == UICollectionView.elementKindSectionHeader
            else {
                continue
            }

            let section = attributes.indexPath.section
            
            let numberOfItems = collectionView.numberOfItems(inSection: section)

            guard numberOfItems > 0 else {
                continue
            }

            let firstIndexPath = IndexPath(row: 0, section: section)
            let lastIndexPath = IndexPath(row: numberOfItems - 1, section: section)

            guard let attributesForFirstItemInSection = layoutAttributesForItem(at: firstIndexPath),
                  let attributesForLastItemInSection = layoutAttributesForItem(at: lastIndexPath)
            else {
                continue
            }

            let offsetY = collectionView.contentOffset.y + collectionView.adjustedContentInset.top
            var adjustedFrame = attributes.frame

            let minY = attributesForFirstItemInSection.frame.minY - adjustedFrame.height - sectionInset.top
            let maxY = attributesForLastItemInSection.frame.maxY - adjustedFrame.height + sectionInset.bottom

            let y = min(maxY, max(minY, offsetY))
            adjustedFrame.origin.y = y

            attributes.frame = adjustedFrame
            attributes.zIndex = 99
        }

        return attributesList
    }
    */
}
