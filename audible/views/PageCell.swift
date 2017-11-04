//
//  PageCell.swift
//  audible
//
//  Created by Paul Dong on 4/11/17.
//  Copyright © 2017 Paul Dong. All rights reserved.
//

import UIKit

class PageCell: BaseCell {
    
    var page: Page? {
        didSet {
            guard let page = page else {
                return
            }
        
            let color = UIColor(white: 0.2, alpha: 1)
            
            let attributedText = NSMutableAttributedString(string: page.title, attributes: [NSFontAttributeName : UIFont.systemFont(ofSize: 20, weight: UIFontWeightMedium), NSForegroundColorAttributeName : color])
            
            attributedText.append(NSAttributedString(string: "\n\n\(page.message)", attributes: [NSFontAttributeName : UIFont.systemFont(ofSize: 14), NSForegroundColorAttributeName : color]))
            
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .center
            
            let length = attributedText.string.characters.count
            
            attributedText.addAttributes([NSParagraphStyleAttributeName : paragraphStyle], range: NSRange(location: 0, length: length))
            
            textView.attributedText = attributedText
            
            var imageName = page.imageName
            if UIDevice.current.orientation.isLandscape {
                imageName += "_landscape"
            }
            imageView.image = UIImage(named: imageName)
        }
    }
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "page1")
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    let textView: UITextView = {
        let tv = UITextView()
        tv.isEditable = false
        tv.contentInset = UIEdgeInsets(top: 24, left: 20, bottom: 0, right: 20)
        return tv
    }()
    
    let lineSeparatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.9, alpha: 1)
        return view
    }()

    override func setupView(){
        addSubview(imageView)
        addSubview(textView)
        addSubview(lineSeparatorView)
        
        imageView.anchorWithConstrantsToTop(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor)
        imageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.7).isActive = true
        
        lineSeparatorView.anchorToTop(top: imageView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor)
        lineSeparatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        textView.anchorToTop(top: lineSeparatorView.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)
        
    }
}
