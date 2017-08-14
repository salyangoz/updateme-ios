//
//  OnNegativeButtonClickListener.swift
//  updateme
//
//  Created by Salyangoz.Co on 02/08/2017.
//  Copyright © 2017 Salyangoz. All rights reserved.
//

import Foundation
import SCLAlertView

@objc public protocol OnNegativeButtonClickListener {
    
     @objc optional func onNegativeClick(dialog: SCLAlertView)

}
