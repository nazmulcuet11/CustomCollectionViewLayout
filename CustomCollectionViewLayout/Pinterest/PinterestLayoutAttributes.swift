//
//  PinterestLayoutAttributes.swift
//  CustomCollectionViewLayout
//
//  Created by Nazmul Islam on 3/4/21.
//

import UIKit

class PinterestLayoutAttributes: UICollectionViewLayoutAttributes {
    var photoHeight: CGFloat = 0

    override func copy(with zone: NSZone? = nil) -> Any {
        let copy = super.copy(with: zone) as! PinterestLayoutAttributes
        copy.photoHeight = photoHeight
        return copy
    }

    override func isEqual(_ object: Any?) -> Bool {
        guard let attributes = object as? PinterestLayoutAttributes else {
            return false
        }

        guard attributes.photoHeight == photoHeight else {
            return false
        }

        return super.isEqual(object)
    }
}
