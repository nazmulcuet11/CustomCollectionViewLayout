//
//  StretchyHeadersLayout.swift
//  CustomCollectionViewLayout
//
//  Created by Nazmul Islam on 3/4/21.
//

import UIKit

class StretchyHeadersLayout: UICollectionViewFlowLayout {
    var maximumHeaderHeight: CGFloat = 0

    override func shouldInvalidateLayout(
        forBoundsChange newBounds: CGRect
    ) -> Bool {
        return true
    }

    override class var layoutAttributesClass: AnyClass {
        return StretchyHeadersLayoutAttributes.self
    }

    override func layoutAttributesForElements(
        in rect: CGRect
    ) -> [UICollectionViewLayoutAttributes]? {

        guard let attributesList = super.layoutAttributesForElements(in: rect) as? [StretchyHeadersLayoutAttributes],
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

                let frameHeight = headerReferenceSize.height + deltaY

                var adjustedDeltaY = deltaY
                var adjustedFrameHeight = frameHeight
                if frameHeight > maximumHeaderHeight {
                    let delta = frameHeight - maximumHeaderHeight
                    adjustedDeltaY -= delta
                    adjustedFrameHeight -= delta
                }

                var adjustedFrame = attributes.frame
                adjustedFrame.size.height = adjustedFrameHeight
                adjustedFrame.origin.y = adjustedFrame.minY - deltaY

                attributes.frame = adjustedFrame
                attributes.deltaY = adjustedDeltaY
            }
        }

        return attributesList
    }
}
