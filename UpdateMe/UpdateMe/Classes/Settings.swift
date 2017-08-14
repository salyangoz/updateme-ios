//
//  Settings.swift
//  updateme
//
//  Created by Salyangoz.Co on 02/08/2017.
//  Copyright © 2017 Salyangoz. All rights reserved.
//

import Foundation

public class Settings : NSObject {
    
    public var title: String?
    public let message: String?
    public var updateUrl: String?
    
    public init(title: String, message: String, updateUrl: String) {
        self.title = title
        self.message = message
        self.updateUrl = updateUrl

    }

}
