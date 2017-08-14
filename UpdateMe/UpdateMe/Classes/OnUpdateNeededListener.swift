//
//  OnUpdateNeededListener.swift
//  updateme
//
//  Created by Salyangoz.Co on 02/08/2017.
//  Copyright © 2017 Salyangoz. All rights reserved.
//

import Foundation


@objc public protocol OnUpdateNeededListener {
    
    @objc optional func onUpdateNeeded(settings:Settings)

}
