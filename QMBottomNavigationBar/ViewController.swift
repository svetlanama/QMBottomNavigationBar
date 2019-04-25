//
//  ViewController.swift
//  UUBottomNavigationBar
//
//  Created by Svitlana Moiseyenko on 4/22/19.
//  Copyright © 2019 sm. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
 
    @IBAction func simulateNext(sender: UIButton) {
        doSimulateNext()
    }
    
    
    @IBAction func moveNext(sender: UIButton) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "SecondViewControllerID") as! SecondViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBOutlet private weak var bottomBar: QMBottomNavigationBar? {
        didSet {
            bottomBar?.navigationBarDelegate = self
            bottomBar?.initialBottomNavigationBarSetup()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func doSimulateNext() {
        
        let right = UIBarButtonItem(image: UIImage(named: "CameraIcon"), style: .plain, target: self, action:  #selector(rightTapped))

        let item = UINavigationItem(title: "")
        item.rightBarButtonItem = right
        
        let buttonBarBlock: QMButtonBarBlock = QMButtonBarBlock.instanceFromNib()
        buttonBarBlock.delegate = self

        item.titleView?.isUserInteractionEnabled = true
        item.titleView = buttonBarBlock

 
        bottomBar?.pushItem(item, animated: false)
    }

    @objc func rightTapped() {
    
    }
}

extension ViewController: QMBottomNavigationBarDelegate {
    func leftButtonClick() {
        print("...leftButtonClick...")
    }
    
    func rightButtonClick() {
         print("...rightButtonClick...")
    }
    
    func backButtonClick() {
        print("...backButtonClick...")
    }
}

extension ViewController: QMButtonBarBlockDelegate {
    func fisrttButtonClick() {
    }
    
    func lastButtonClick() {
    }
    
    func middleButtonClick() {
         print("...middleButtonClick...")
    }
}
