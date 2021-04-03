//
//  ViewControllerFactory.swift
//  CustomCollectionViewLayout
//
//  Created by Nazmul Islam on 3/4/21.
//

import UIKit

class ViewControllerFactory {
    func getAppRootVC() -> UIViewController {
        let vc = HomeVC.instantiate()
        vc.vcFactory = self
        let nav = UINavigationController(rootViewController: vc)
        return nav
    }

    func getPinterestVC() -> UIViewController {
        let layout = PinterestLayout()
        let vc = PinterestVC(collectionViewLayout: layout)
        vc.vcFactory = self
        layout.delegate = vc
        return vc
    }

    func getScheduleVC() -> UIViewController {
        let layout = StretchyHeadersLayout()
        let vc = ScheduleVC(collectionViewLayout: layout)
        vc.vcFactory = self
        return vc
    }
}
