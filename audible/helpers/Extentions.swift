//
//  Extentions.swift
//  swift_myyoutube
//
//  Created by Paul Dong on 10/09/17.
//  Copyright © 2017 Paul Dong. All rights reserved.
//

import UIKit

extension UIColor {
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
}

extension UIView {
    func addConstraints(format: String, views: UIView ...)  {
        var viewDictioonary = [String : UIView]()
        
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewDictioonary[key] = view
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewDictioonary))
    }
}

class BaseCell: UICollectionViewCell{
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(){}
    
}

extension UIView {
    func anchorToTop(
        top: NSLayoutYAxisAnchor? = nil,
        left: NSLayoutXAxisAnchor? = nil,
        bottom: NSLayoutYAxisAnchor? = nil,
        right: NSLayoutXAxisAnchor? = nil
    ) {
        anchorWithConstrantsToTop(top: top, left: left, bottom: bottom, right: right)
    }
    
    func anchorWithConstrantsToTop(
        top: NSLayoutYAxisAnchor? = nil,
        left: NSLayoutXAxisAnchor? = nil,
        bottom: NSLayoutYAxisAnchor? = nil,
        right: NSLayoutXAxisAnchor? = nil,
        topConstant: CGFloat = 0,
        leftConstant: CGFloat = 0,
        bottomConstant: CGFloat = 0,
        rightConstant: CGFloat = 0
    ) {
        _ = anchor(top, left: left, bottom: bottom, right: right, topConstant: topConstant, leftConstant: leftConstant, bottomConstant: bottomConstant, rightConstant: rightConstant)
    }
    
    func anchor(
        _ top: NSLayoutYAxisAnchor? = nil,
        left: NSLayoutXAxisAnchor? = nil,
        bottom: NSLayoutYAxisAnchor? = nil,
        right: NSLayoutXAxisAnchor? = nil,
        topConstant: CGFloat = 0,
        leftConstant: CGFloat = 0,
        bottomConstant: CGFloat = 0,
        rightConstant: CGFloat = 0,
        widthConstant: CGFloat = 0,
        heightConstant: CGFloat = 0
        ) -> [String : NSLayoutConstraint] {
        translatesAutoresizingMaskIntoConstraints = false
        
        var anchors = [String : NSLayoutConstraint]()
        
        if let top = top {
            anchors["top"] = topAnchor.constraint(equalTo: top, constant: topConstant)
        }
        
        if let bottom = bottom {
            anchors["bottom"] = bottomAnchor.constraint(equalTo: bottom, constant: bottomConstant)
        }
        
        if let left = left {
            anchors["left"] = leftAnchor.constraint(equalTo: left, constant: leftConstant)
        }
        
        if let right = right {
            anchors["right"] = rightAnchor.constraint(equalTo: right, constant: rightConstant)
        }
        
        if widthConstant > 0 {
            anchors["width"] = widthAnchor.constraint(equalToConstant: widthConstant)
        }
        
        if heightConstant > 0 {
            anchors["height"] = heightAnchor.constraint(equalToConstant: heightConstant)
        }
        
        anchors.forEach { $0.value.isActive = true }
        return anchors
    }
}

class PaddedTextField: UITextField {
    var padding: CGFloat = 0
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return paddingTextRect()
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return paddingTextRect()
    }
    
    func paddingTextRect() -> CGRect {
        return CGRect(x: bounds.origin.x + 10, y: bounds.origin.y, width: bounds.width - 10, height: bounds.height)
    }
}

