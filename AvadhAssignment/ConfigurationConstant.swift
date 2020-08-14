//
//  ConfigurationConstant.swift
//  AvadhAssignment
//
//  Created by Avadh Mewada on 8/13/20.
//  Copyright © 2020 Avadh. All rights reserved.
//

import UIKit

//MARK:- Application Name
let AppName = Bundle.main.object(forInfoDictionaryKey: "CFBundleName") as! String

//MARK:- Devices Type
let IS_IPAD = UIDevice.current.userInterfaceIdiom == .pad
let IS_IPHONE = UIDevice.current.userInterfaceIdiom == .phone
let modelNo = UIDevice.current.model
let osVersion = UIDevice.current.systemVersion

//MARK:- get Devices Width and Height
let SCREEN_WIDTH = CGFloat(UIScreen.main.bounds.size.width)
let SCREEN_HEIGHT = UIScreen.main.bounds.size.height
let SCREEN_MAX_LENGTH = max(SCREEN_WIDTH, SCREEN_HEIGHT)
let SCREEN_MIN_LENGTH = min(SCREEN_WIDTH, SCREEN_HEIGHT)
let IS_IPHONE_5 = (IS_IPHONE && SCREEN_MAX_LENGTH == 568.0)
let IS_IPHONE_4_OR_LESS = (IS_IPHONE && SCREEN_MAX_LENGTH < 568.0)
let IS_IPHONE_6 = (IS_IPHONE && SCREEN_MAX_LENGTH == 667.0)
let IS_IPHONE_6P = (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0)
let IS_IPHONE_X = (IS_IPHONE && SCREEN_HEIGHT >= 812.0)

var STATUS_BAR_HEIGHT : CGFloat {
    return UIApplication.shared.statusBarFrame.height
}

let IS_IPHONE_WITH_NOTCH = (IS_IPHONE && STATUS_BAR_HEIGHT > 20)

var bottomMarginFromSafeArea: CGFloat {
    return UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? 0
}

//MARK:- AppDelegate
let K_AppDelegate = UIApplication.shared.delegate as! AppDelegate


//MARK:- NotificationCenter
let K_NC = NotificationCenter.default

//MARK:- AppDelegates instances
let appDelegate = UIApplication.shared.delegate as! AppDelegate

//MARK:- TableView
let groupTablePadding: CGFloat = 35

//MARK:- TextFieldValidation
let ALPHA = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
let ALPHAWITHSPACE = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz "
let NUMERIC = "1234567890"
let ALPHANUMERIC = "\(ALPHA)\(NUMERIC)"
let ALPHANUMERICWITHSPACE = "\(ALPHAWITHSPACE)\(NUMERIC)"

public typealias JSONObject = [String : Any]


public var commonTokenValue : String { return "8e05ef03752a2bb03b844a3bf2d1a06e" }
