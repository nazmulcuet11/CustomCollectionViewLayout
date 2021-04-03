//
//  ViewController.swift
//  CustomCollectionViewLayout
//
//  Created by Nazmul Islam on 2/4/21.
//

import UIKit

class HomeVC: UIViewController, StoryboardBased {

    // MARK: - Dependency
    
    var vcFactory: ViewControllerFactory!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func didTapPinterestBtn(_ sender: Any) {
        let vc = vcFactory.getPinterestVC()
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func didTapStretchyHeadersBtn(_ sender: Any) {
        let vc = vcFactory.getScheduleVC()
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func didTapStickyHeadersBtn(_ sender: Any) {
        let vc = vcFactory.getStickyHeadersVC()
        navigationController?.pushViewController(vc, animated: true)
    }
}

