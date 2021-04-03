//
//  StretchyHeaderLayoutAttributes.swift
//  CustomCollectionViewLayout
//
//  Created by Nazmul Islam on 3/4/21.
//

import UIKit

class StretchyHeadersLayoutAttributes: UICollectionViewLayoutAttributes {
    var deltaY: CGFloat = 0

    override func copy(with zone: NSZone? = nil) -> Any {
        let copy = super.copy(with: zone) as! StretchyHeadersLayoutAttributes
        copy.deltaY = deltaY
        return copy
    }

    override func isEqual(_ object: Any?) -> Bool {
        guard let object = object as? StretchyHeadersLayoutAttributes else {
            return false
        }

        guard object.deltaY == deltaY else {
            return false
        }

        return super.isEqual(object)
    }
}
