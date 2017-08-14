//
//  UpdateMe.swift
//  updateme
//
//  Created by Salyangoz.Co on 01/08/2017.
//  Copyright © 2017 Salyangoz. All rights reserved.
//

import Foundation
import SCLAlertView
import FirebaseCore
import FirebaseRemoteConfig

//import FirebaseCoreDiagnostics
public class UpdateMe {

    //Default Variables
    public static let DEFAULT_UPDATE_URL: String = "https://itunes.apple.com/us/app/google-search-made-just-for-mobile/id284815942?mt=8"
    public static let DEFAULT_CURRENT_VERSION: String = "1.0.0"
    public static let DEFAULT_UPDATE_NEEDED: Bool = false
    public static let DEFAULT_DIALOG_TITLE : String = "New Version Available"
    public static let DEFAULT_DIALOG_MESSAGE : String = "Please, update app to new version to continue using."
    


    var onUpdateNeededListener: OnUpdateNeededListener?
    var onNegativeButtonClickListener: OnNegativeButtonClickListener?
    var onPositiveButtonClickListener: OnPositiveButtonClickListener?
    var dialogVisibility: Bool = true
    var continueButtonVisibility: Bool = false
    var positiveButtonText: String!
    var positiveButtonTextColor: UIColor!
    var negativeButtonText: String!
    var negativeButtonTextColor: UIColor!
    var fetchIntervalInSeconds: Int = 30
    var topColor: UInt!
    var dialogIcon: UIImage!
    var remoteConfig: RemoteConfig!



    public static func with() -> UpdateMeBuilder {

        return UpdateMeBuilder()

    }

    public static func with(fetchIntervalInSeconds: Int) -> UpdateMeBuilder {

        return UpdateMeBuilder().setFetchInterval(second: fetchIntervalInSeconds)

    }

    public init( checkIntervalInSeconds: Int, positiveButtonText: String, negativeButtonText: String, dialogVisibility: Bool, continueButtonVisibility: Bool, dialogIcon: UIImage, positiveButtonTextColor: UIColor, negativeButtonTextColor: UIColor, topColor: UInt) {

        self.fetchIntervalInSeconds = checkIntervalInSeconds
        self.positiveButtonText = positiveButtonText
        self.negativeButtonText = negativeButtonText
        self.dialogVisibility = dialogVisibility
        self.continueButtonVisibility = continueButtonVisibility
        self.dialogIcon = dialogIcon
        self.positiveButtonTextColor = positiveButtonTextColor
        self.negativeButtonTextColor = negativeButtonTextColor
        self.topColor = topColor

        //Initiliaze Firebase
        self.configureFirebase()

    }

    public func configureFirebase() {

        FirebaseApp.configure()

        self.remoteConfig = RemoteConfig.remoteConfig()

        //Default Configurations
        self.remoteConfig.setDefaults(fromPlist: "RemoteConfig")
        self.remoteConfig.fetch(withExpirationDuration: TimeInterval(fetchIntervalInSeconds)) { (status, error) -> Void in
            if status == .success {
                print("Config fetched!")
                self.remoteConfig.activateFetched()
            } else {
                print("Config not fetched")
                print("Error \(error!.localizedDescription)")
            }

        }


    }

    public func check() {

        let remoteConfig: RemoteConfig = RemoteConfig.remoteConfig()
        let updateNeed: Bool = remoteConfig[Config.KEY_UPDATE_REQUIRED].boolValue

        if(updateNeed) {

            let message: String = (remoteConfig[Config.KEY_DIALOG_DESCRIPTION].stringValue!.isEmpty) ? UpdateMe.DEFAULT_DIALOG_MESSAGE : remoteConfig[Config.KEY_DIALOG_DESCRIPTION].stringValue!
            let title: String = (remoteConfig[Config.KEY_DIALOG_TITLE].stringValue!.isEmpty) ? UpdateMe.DEFAULT_DIALOG_TITLE : remoteConfig[Config.KEY_DIALOG_TITLE].stringValue!
            let currentVersion: String = remoteConfig[Config.KEY_CURRENT_VERSION].stringValue!
            let updateUrl: String = remoteConfig[Config.KEY_UPDATE_URL].stringValue!
            let positiveButtonText: String = self.positiveButtonText!
            let appVersion: String = Utilities.getAppVersion()

            let settings: Settings = Settings(title: title, message: message, updateUrl: updateUrl)

            if(appVersion != currentVersion) {

                if let onUpdateNeededListener = onUpdateNeededListener {
                    onUpdateNeededListener.onUpdateNeeded?(settings: settings)
                }

                if(!dialogVisibility) {
                    return
                }

                let appearance = SCLAlertView.SCLAppearance(
                    kTitleFont: UIFont(name: "HelveticaNeue", size: 20)!,
                    kTextFont: UIFont(name: "HelveticaNeue", size: 14)!,
                    kButtonFont: UIFont(name: "HelveticaNeue-Bold", size: 14)!,
                    showCloseButton: false
                )

                let alertView = SCLAlertView(appearance: appearance)
                
                
                alertView.addButton(positiveButtonText, backgroundColor: UIColor.white, textColor: positiveButtonTextColor, showDurationStatus: false) {

                    self.onPositiveButtonClickListener?.onPositiveClick?(dialog: alertView)
                    Utilities.openStore(updateUrl: updateUrl)

                }

                if(continueButtonVisibility) {

                    alertView.addButton(negativeButtonText, backgroundColor: UIColor.white, textColor: negativeButtonTextColor, showDurationStatus: false) {

                        self.onNegativeButtonClickListener?.onNegativeClick?(dialog: alertView)
                        alertView.dismiss(animated: true, completion: nil)

                    }

                }
                
                
                alertView.showInfo(title, subTitle: message, colorStyle: topColor, circleIconImage: dialogIcon, animationStyle: .topToBottom)

            }

        }

    }

}
