//
//  UIFont+Extension.swift
//  AvadhAssignment
//
//  Created by Avadh Mewada on 8/13/20.
//  Copyright © 2020 Avadh. All rights reserved.
//

import UIKit

extension UIFont {
    /* Usage:
     * headerNameLabel.font = UIFont.customFontOfSize(14.0)
     */
    class func regularSystemFont(withSize: CGFloat) -> UIFont {
        if IS_IPAD {
            return UIFont.systemFont(ofSize: withSize+8)
        } else if IS_IPHONE_6P || IS_IPHONE_X {
            return UIFont.systemFont(ofSize: withSize+2)
        } else if IS_IPHONE_6 {
            return UIFont.systemFont(ofSize: withSize+1)
        } else {
            return UIFont.systemFont(ofSize: withSize)
        }
    }
    
    class func semiboldSystemFont(withSize: CGFloat) -> UIFont {
        if IS_IPAD {
            return UIFont.systemFont(ofSize: withSize+8, weight: .semibold)
        } else if IS_IPHONE_6P || IS_IPHONE_X {
            return UIFont.systemFont(ofSize: withSize+2, weight: .semibold)
        } else if IS_IPHONE_6 {
            return UIFont.systemFont(ofSize: withSize+1, weight: .semibold)
        } else {
            return UIFont.systemFont(ofSize: withSize, weight: .semibold)
        }
    }
    
    class func boldSystemFont(withSize: CGFloat) -> UIFont {
        if IS_IPAD {
            return UIFont.boldSystemFont(ofSize: withSize+8)
        } else if IS_IPHONE_6P || IS_IPHONE_X {
            return UIFont.boldSystemFont(ofSize: withSize+2)
        } else if IS_IPHONE_6 {
            return UIFont.boldSystemFont(ofSize: withSize+1)
        } else {
            return UIFont.boldSystemFont(ofSize: withSize)
        }
    }
    
    //regular
    
    class var regularSmallestFont : UIFont {
        return UIFont.regularSystemFont(withSize: 12)
    }
    
    class var regularSmallFont: UIFont {
        return UIFont.regularSystemFont(withSize: 14)
    }
    
    class var regularTitleFont: UIFont {
        return UIFont.regularSystemFont(withSize: 16)
    }
    
    class var regularValueFont: UIFont {
        return UIFont.regularSystemFont(withSize: 18)
    }
    
    class var regularMediumFont: UIFont {
        return UIFont.regularSystemFont(withSize: 20)
    }
    
    class var regularLargeFont: UIFont {
        return UIFont.regularSystemFont(withSize: 22)
    }
    
    //regular
    
    class var semiboldSmallestFont : UIFont {
        return UIFont.semiboldSystemFont(withSize: 12)
    }
    
    class var semiboldSmallFont: UIFont {
        return UIFont.semiboldSystemFont(withSize: 14)
    }
    
    class var semiboldTitleFont: UIFont {
        return UIFont.semiboldSystemFont(withSize: 16)
    }
    
    class var semiboldValueFont: UIFont {
        return UIFont.semiboldSystemFont(withSize: 18)
    }
    
    class var semiboldMediumFont: UIFont {
        return UIFont.semiboldSystemFont(withSize: 20)
    }
    
    class var semiboldLargeFont: UIFont {
        return UIFont.semiboldSystemFont(withSize: 22)
    }
    
    //bold
    
    class var boldVerySmallestFont : UIFont {
        return UIFont.boldSystemFont(withSize: 12)
    }
    
    class var boldSmallFont: UIFont {
        return UIFont.boldSystemFont(withSize: 14)
    }
    
    class var boldTitleFont: UIFont {
        return UIFont.boldSystemFont(withSize: 16)
    }
    
    class var boldValueFont: UIFont {
        return UIFont.boldSystemFont(withSize: 18)
    }
    
    class var boldMediumFont: UIFont {
        return UIFont.boldSystemFont(withSize: 20)
    }
    
    class var boldLargeFont: UIFont {
        return UIFont.boldSystemFont(withSize: 22)
    }
}
