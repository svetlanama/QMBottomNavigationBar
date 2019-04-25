//
//  QMBottomBar.swift
//  UIBottomBar
//
//  Created by Svitlana Moiseyenko on 4/22/19.
//  Copyright © 2019 sm. All rights reserved.
//

import Foundation
import UIKit

protocol QMBottomNavigationBarDelegate: class {
    func leftButtonClick()
    func rightButtonClick()
    func backButtonClick()
}

class QMBottomNavigationBar: UINavigationBar {
 
    
    weak var navigationBarDelegate: QMBottomNavigationBarDelegate?
    var customHeight : CGFloat = 70
    

    @IBInspectable
    open var contentEdgeInsets = UIEdgeInsets.zero {
        didSet {
            layoutSubviews()
        }
    }
 
    @IBInspectable
    open var backButtonImage: UIImage? {
        get {
            return backIndicatorImage
        }
        set(value) {
            let image: UIImage? = value
            backIndicatorImage = image
            backIndicatorTransitionMaskImage = image
        }
    }
    
 
    @IBInspectable
    open var leftButtonImage: UIImage?
    
    @IBInspectable
    open var rightButtonImage: UIImage?
    
 
    @IBInspectable
    open override var backgroundColor: UIColor? {
        get {
            return barTintColor
        }
        set(value) {
            barTintColor = value
        }
    }
    
    @IBInspectable
    open var controlTintColor: UIColor? {
        get {
            return tintColor
        }
        set(value) {
            tintColor = controlTintColor
        }
    }
 
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initDefaults()
    }
 
    public override init(frame: CGRect) {
        super.init(frame: frame)
        initDefaults()
    }
    
    public convenience init() {
        self.init(frame: .zero)
    }
    
    // enable tapping
//    override var intrinsicContentSize: CGSize {
//        return UIView.layoutFittingExpandedSize
//    }
    
    open override var intrinsicContentSize: CGSize {
        return CGSize(width: bounds.width, height: customHeight)
    }
    
    open override func sizeThatFits(_ size: CGSize) -> CGSize {
        return intrinsicContentSize
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        
        layoutBottomNavigationBarHeight()
    }
 
  
    
    open override func pushItem(_ item: UINavigationItem, animated: Bool) {
        super.pushItem(item, animated: animated)
        
        setNeedsLayout()
        layoutIfNeeded()
    }

    internal func initDefaults() {
        barStyle = .black
        isTranslucent = false

        let image = UIImage()
        shadowImage = image
        setBackgroundImage(image, for: .default)
        
        backgroundColor = .white
        //barTintColor = .white
    }
    
    open func initialBottomNavigationBarSetup() {
        let right = UIBarButtonItem(image: rightButtonImage, style: .plain, target: self, action:  #selector(QMBottomNavigationBar.rightButtonClick))
        let left = UIBarButtonItem(image: leftButtonImage, style: .plain, target: self, action:  #selector(QMBottomNavigationBar.leftButtonClick))
        

        let item = UINavigationItem(title: "")
        item.rightBarButtonItem = right
        item.leftBarButtonItem = left
        item.titleView?.tintColor = controlTintColor
        setItems([item], animated: false)

    }
 
    
    func layoutBottomNavigationBarHeight() {
        let y = frame.origin.y
        frame = CGRect(x: frame.origin.x, y:  y, width: frame.size.width, height: customHeight)
        
        for subview in self.subviews {
            var stringFromClass = NSStringFromClass(subview.classForCoder)
            if stringFromClass.contains("BarBackground") {
                subview.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: customHeight)
                subview.backgroundColor = self.backgroundColor
            }
            
            stringFromClass = NSStringFromClass(subview.classForCoder)
            if stringFromClass.contains("BarContent") {
                subview.frame = CGRect(x: subview.frame.origin.x, y: 20, width: subview.frame.width, height: customHeight)
                subview.backgroundColor = self.backgroundColor
            }
        }
    }
 
    
    @objc func rightButtonClick() {
        navigationBarDelegate?.rightButtonClick()
    }
    
    @objc func leftButtonClick() {
        navigationBarDelegate?.leftButtonClick()
    }
    
    override func popItem(animated: Bool) -> UINavigationItem? {
        let item = super.popItem(animated: false)
        
        setNeedsLayout()
        layoutIfNeeded()
        navigationBarDelegate?.backButtonClick()
        return item
    }
}

