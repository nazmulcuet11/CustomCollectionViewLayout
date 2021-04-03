//
//  StretchyHeadersLayout.swift
//  CustomCollectionViewLayout
//
//  Created by Nazmul Islam on 3/4/21.
//

import UIKit

class StretchyHeadersLayout: UICollectionViewFlowLayout {
    override func shouldInvalidateLayout(
        forBoundsChange newBounds: CGRect
    ) -> Bool {
        return true
    }

    override class var layoutAttributesClass: AnyClass {
        return StretchyHeaderLayoutAttributes.self
    }

    override func layoutAttributesForElements(
        in rect: CGRect
    ) -> [UICollectionViewLayoutAttributes]? {

        guard let attributesList = super.layoutAttributesForElements(in: rect) as? [StretchyHeaderLayoutAttributes],
              let collectionView = collectionView else {
            return nil
        }

        let inset = collectionView.adjustedContentInset
        let offset = collectionView.contentOffset
        let minY = -inset.top

        guard offset.y < minY else {
            // not scrolled down
            return attributesList
        }

        let deltaY = abs(minY - offset.y)
        for attributes in attributesList {
            if let kind = attributes.representedElementKind,
               kind == UICollectionView.elementKindSectionHeader {

                var frame = attributes.frame
                frame.size.height = max(0, headerReferenceSize.height + deltaY)
                frame.origin.y = frame.minY - deltaY

                attributes.frame = frame
                attributes.deltaY = deltaY
            }
        }

        return attributesList
    }
}
