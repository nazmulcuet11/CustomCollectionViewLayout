//
//  ScheduleViewController.swift
//  RWDevCon
//
//  Created by Mic Pringle on 06/03/2015.
//  Copyright (c) 2015 Ray Wenderlich. All rights reserved.
//

import UIKit

class ScheduleVC: UICollectionViewController {

    var vcFactory: ViewControllerFactory!

    let sessions = Session.getDummySessions()

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Stretchy Headers"

        collectionView.backgroundColor = .white

        collectionView.registerNibCell(ScheduleCell.self)
        collectionView.registerNibReusableSupplementaryView(
            ScheduleHeaderView.self,
            ofKind: UICollectionView.elementKindSectionHeader
        )

        if let layout = collectionViewLayout as? StretchyHeadersLayout {
            let width = collectionView.bounds.width
            
            layout.itemSize = CGSize(width: width, height: 62)
            layout.headerReferenceSize = CGSize(width: width, height: 180)
            layout.maximumHeaderHeight = width
        }
    }
}

extension ScheduleVC {

    override func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {

        return sessions.count
    }

    override func collectionView(
        _ collectionView: UICollectionView,
        viewForSupplementaryElementOfKind kind: String,
        at indexPath: IndexPath
    ) -> UICollectionReusableView {

        let header = collectionView.dequeueReusableSupplementaryView(
            ScheduleHeaderView.self,
            ofKind: kind,
            for: indexPath
        )
        return header
    }

    override func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(ScheduleCell.self, for: indexPath)
        cell.session = sessions[indexPath.item]
        return cell
    }
}
