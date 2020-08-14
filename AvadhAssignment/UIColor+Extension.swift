//
//  UIColor+Extension.swift
//  AvadhAssignment
//
//  Created by Avadh Mewada on 8/13/20.
//  Copyright © 2020 Avadh. All rights reserved.
//

import UIKit

extension UIColor
{
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat = 1.0) -> UIColor
    {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        return UIColor(red: red / 255.0, green: green / 255.0, blue: blue / 255.0, alpha: alpha)
    }
    
}
