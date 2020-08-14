//
//  UIView+Extension.swift
//  AvadhAssignment
//
//  Created by Avadh Mewada on 8/13/20.
//  Copyright © 2020 Avadh. All rights reserved.
//

import UIKit

extension UIView {
    
    public enum CornerRadiusType {
        case byHeight
        case byWidth
    }
    
    func setFullCornerRadius(type : CornerRadiusType = .byHeight, borderColor : UIColor = .clear, borderWidth : CGFloat = 0) {
        self.layoutIfNeeded()
        self.layer.masksToBounds = true
        let getSize : CGFloat = type == .byHeight ? self.frame.height : self.frame.width
        self.layer.cornerRadius = getSize / 2
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
    }
    
    func setCustomCornerRadius(radius : CGFloat, borderColor : UIColor = .clear, borderWidth : CGFloat = 0) {
        self.layer.masksToBounds = true
        self.layer.cornerRadius = radius
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
    }
    
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        layoutIfNeeded()
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    
    
    //MARK:- Add Shadow to View
    func addShadowToBottomOfView(shadowColor : UIColor, shadowOpacity : Float)
    {
        self.layer.shadowColor = shadowColor.cgColor
        self.layer.masksToBounds = false
        self.layer.shadowOffset = CGSize(width: 0, height : 0);
        self.layer.shadowOpacity = shadowOpacity
        //self.clipsToBounds = false
    }
    
    //MARK:- Add Shadow
    
    func addShadow(color:UIColor = .black,radius:CGFloat = 3.0, offset: CGSize, opacity: Float = 0.3) {
        self.layer.masksToBounds = false
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOffset = offset
        self.layer.shadowOpacity = opacity
        self.layer.shadowRadius = radius
    }
    
    //MARK:- Round Corners Specified
    
    //Hide Keyboard
    func hideKeyBoard() {
        self.endEditing(true)
    }
    
    class func hideKeyBoard() {
        UIApplication.shared.keyWindow?.hideKeyBoard()
    }
    
    //MARK: Anchors
    
    func fullFillOnSuperView(padding: UIEdgeInsets = .zero) {
        if let getSuperView = self.superview {
            self.translatesAutoresizingMaskIntoConstraints = false
            self.topAnchor.constraint(equalTo: getSuperView.topAnchor, constant: padding.top).isActive = true
            self.leftAnchor.constraint(equalTo: getSuperView.leftAnchor, constant: padding.left).isActive = true
            self.rightAnchor.constraint(equalTo: getSuperView.rightAnchor, constant: padding.right).isActive = true
            self.bottomAnchor.constraint(equalTo: getSuperView.bottomAnchor, constant: padding.bottom).isActive = true
        }
    }
    
    func anchors(top: NSLayoutYAxisAnchor?, left: NSLayoutXAxisAnchor?, right: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, padding: UIEdgeInsets = .zero) {
        self.translatesAutoresizingMaskIntoConstraints = false
        if let anchor = top {
            self.topAnchor.constraint(equalTo: anchor, constant: padding.top).isActive = true
        }
        if let anchor = left {
            self.leftAnchor.constraint(equalTo: anchor, constant: padding.left).isActive = true
        }
        if let anchor = right {
            self.rightAnchor.constraint(equalTo: anchor, constant: padding.right).isActive = true
        }
        if let anchor = bottom {
            self.bottomAnchor.constraint(equalTo: anchor, constant: padding.bottom).isActive = true
        }
    }
    
    func anchorsGreaterThan(top: NSLayoutYAxisAnchor?, left: NSLayoutXAxisAnchor?, right: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, padding: UIEdgeInsets = .zero) {
           self.translatesAutoresizingMaskIntoConstraints = false
           if let anchor = top {
               self.topAnchor.constraint(greaterThanOrEqualTo: anchor, constant: padding.top).isActive = true
           }
           if let anchor = left {
               self.leftAnchor.constraint(greaterThanOrEqualTo: anchor, constant: padding.left).isActive = true
           }
           if let anchor = right {
               self.rightAnchor.constraint(greaterThanOrEqualTo: anchor, constant: padding.right).isActive = true
           }
           if let anchor = bottom {
               self.bottomAnchor.constraint(greaterThanOrEqualTo: anchor, constant: padding.bottom).isActive = true
           }
       }
    
    func setHeightWidth(width: CGFloat?, height: CGFloat?) {
        self.translatesAutoresizingMaskIntoConstraints = false
        if let getWidth = width {
            self.widthAnchor.constraint(equalToConstant: getWidth).isActive = true
        }
        
        if let getHeight = height {
            self.heightAnchor.constraint(equalToConstant: getHeight).isActive = true
        }
    }
    
    func setCenterXAndY(setX: Bool?, setY: Bool?, xConstant:CGFloat = 0, yConstant: CGFloat = 0) {
        if let getSuperView = self.superview {
            self.translatesAutoresizingMaskIntoConstraints = false
            if let getX = setX, getX {
                self.centerXAnchor.constraint(equalTo: getSuperView.centerXAnchor, constant: xConstant).isActive = true
            }
            if let getY = setY, getY {
                self.centerYAnchor.constraint(equalTo: getSuperView.centerYAnchor, constant: xConstant).isActive = true
            }
        }
    }

    
}

