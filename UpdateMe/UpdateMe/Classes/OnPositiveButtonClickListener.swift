//
//  OnPositiveButtonClickListener.swift
//  updateme
//
//  Created by Salyangoz.Co on 02/08/2017.
//  Copyright © 2017 Salyangoz. All rights reserved.
//

import Foundation
import SCLAlertView

@objc public protocol OnPositiveButtonClickListener {
    
    @objc optional func onPositiveClick(dialog: SCLAlertView)

}
