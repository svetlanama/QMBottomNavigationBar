//
//  QMButtonBlock.swift
//  UIBottomNavigationBar
//
//  Created by Svitlana Moiseyenko on 4/25/19.
//  Copyright © 2019 sm. All rights reserved.
//

import Foundation
import UIKit



protocol QMButtonBarBlockDelegate: class {
    func middleButtonClick()
    func fisrttButtonClick()
    func lastButtonClick()
}


class QMButtonBarBlock: UIView {
    
    weak var delegate: QMButtonBarBlockDelegate?
    
    @IBOutlet private weak var middle: UIButton?
    @IBAction func onMiddleButtonClick(sender: UIButton) {
        delegate?.middleButtonClick()
    }
    
    // enable tapping
    override var intrinsicContentSize: CGSize {
        return UIView.layoutFittingExpandedSize
    }
    
    class func instanceFromNib() -> QMButtonBarBlock {
        return UINib(nibName: "QMButtonBarBlock", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! QMButtonBarBlock
    }
}


