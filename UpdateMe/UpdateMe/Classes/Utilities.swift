//
//  Utilities.swift
//  updateme
//
//  Created by Salyangoz.Co on 02/08/2017.
//  Copyright © 2017 Salyangoz. All rights reserved.
//

import Foundation

public class Utilities {

    public static func getAppVersion() -> String {

        if let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String {
            return version
        }

        return ""

    }

    public static func openStore(updateUrl: String) {
        let url = URL(string: updateUrl)
        UIApplication.shared.open(url!, options: [:], completionHandler: nil)

    }

}
