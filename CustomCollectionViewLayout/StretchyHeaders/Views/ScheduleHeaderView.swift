//
//  ScheduleHeaderView.swift
//  RWDevCon
//
//  Created by Mic Pringle on 06/03/2015.
//  Copyright (c) 2015 Ray Wenderlich. All rights reserved.
//

import UIKit

class ScheduleHeaderView: UICollectionReusableView {

    @IBOutlet private weak var backgroundImageView: UIView!
    @IBOutlet private weak var foregroundImageView: UIView!

    @IBOutlet private var backgroundImageViewHeightLC: NSLayoutConstraint!
    @IBOutlet private var foregroundImageViewHeightLC: NSLayoutConstraint!

    private var backgroundImageViewHeight: CGFloat = 0
    private var foregroundImageViewHeight: CGFloat = 0

    override func awakeFromNib() {
        super.awakeFromNib()

        backgroundImageViewHeight = backgroundImageView.bounds.height
        foregroundImageViewHeight = foregroundImageView.bounds.height
    }

    override func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
        super.apply(layoutAttributes)

        guard let layoutAttributes = layoutAttributes as? StretchyHeaderLayoutAttributes
        else {
            return
        }

        backgroundImageViewHeightLC.constant = backgroundImageViewHeight - layoutAttributes.deltaY
        foregroundImageViewHeightLC.constant = foregroundImageViewHeight + layoutAttributes.deltaY
    }
}
