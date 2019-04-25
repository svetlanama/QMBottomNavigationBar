//
//  SecondViewController.swift
//  QMBottomNavigationBar
//
//  Created by Svitlana Moiseyenko on 4/25/19.
//  Copyright © 2019 sm. All rights reserved.
//

import Foundation
import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet private weak var bottomBar: QMBottomNavigationBar? {
        didSet {
           bottomBar?.navigationBarDelegate = self
           bottomBar?.initialBottomNavigationBarSetup()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        let item = UINavigationItem(title: "")
        bottomBar?.pushItem(item, animated: false)
    }
    
 
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

extension SecondViewController: QMBottomNavigationBarDelegate {
    func backButtonClick() {
        navigationController?.popViewController(animated: true)
    }
    
    func leftButtonClick() {
        print("...leftButtonClick...")
    }
    
    func rightButtonClick() {
        print("...rightButtonClick...")
    }
}
