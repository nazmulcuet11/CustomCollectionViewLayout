//
//  ViewController.swift
//  CustomCollectionViewLayout
//
//  Created by Nazmul Islam on 2/4/21.
//

import UIKit

class HomeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func didTapPinterestBtn(_ sender: Any) {
        let layout = PinterestLayout()
        let vc = PinterestVC(collectionViewLayout: layout)
        layout.delegate = vc
        navigationController?.pushViewController(vc, animated: true)
    }
}

