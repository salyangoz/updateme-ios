//
//  UpdateMeBuilder.swift
//  updateme
//
//  Created by Salyangoz.Co on 01/08/2017.
//  Copyright © 2017 Salyangoz. All rights reserved.
//

import Foundation

public class UpdateMeBuilder {

    var onUpdateNeededListener: OnUpdateNeededListener?
    var onNegativeButtonClickListener: OnNegativeButtonClickListener?
    var onPositiveButtonClickListener: OnPositiveButtonClickListener?
    var dialogVisibility: Bool = true
    var continueButtonVisibility: Bool = false
    var positiveButtonText: String?
    var positiveButtonTextColor: UIColor?
    var negativeButtonText: String?
    var negativeButtonTextColor: UIColor?
    var fetchIntervalInSeconds: Int = 30
    var topColor: UInt?
    var dialogIcon: UIImage?


    public init() {

        self.positiveButtonText = Config.POSTIIVE_DIALOG_TITLE
        self.positiveButtonTextColor = UIColor.cyan
        self.negativeButtonText = Config.NEGATIVE_DIALOG_TITLE
        self.dialogIcon = UIImage(named: "info.png")
        self.positiveButtonTextColor = UIColor.orange
        self.negativeButtonTextColor = UIColor.black
        self.topColor = 0x000000


    }

    public func build() -> UpdateMe {

        let updateMe:UpdateMe = UpdateMe(checkIntervalInSeconds: fetchIntervalInSeconds, positiveButtonText: positiveButtonText!, negativeButtonText: negativeButtonText!, dialogVisibility: dialogVisibility, continueButtonVisibility: continueButtonVisibility, dialogIcon: dialogIcon!, positiveButtonTextColor: positiveButtonTextColor!, negativeButtonTextColor: negativeButtonTextColor!, topColor: topColor!)
        
        if let onUpdateNeededListener = onUpdateNeededListener{
            updateMe.onUpdateNeededListener = onUpdateNeededListener
        }
        
        if let onNegativeButtonClickListener = onNegativeButtonClickListener {
            updateMe.onNegativeButtonClickListener = onNegativeButtonClickListener
        }
        
        if let onPositiveButtonClickListener = onPositiveButtonClickListener {
            updateMe.onPositiveButtonClickListener = onPositiveButtonClickListener
        }
        
        return updateMe

    }

    public func check() -> UpdateMe {

        let updateMe: UpdateMe = build()
        updateMe.check()

        return updateMe


    }

    public func onUpdateNeeded(onUpdateNeededListener: OnUpdateNeededListener) -> UpdateMeBuilder {

        self.onUpdateNeededListener = onUpdateNeededListener
        return self

    }

    public func onPositiveButtonClick(onPositiveButtonClickListener: OnPositiveButtonClickListener) -> UpdateMeBuilder {

        self.onPositiveButtonClickListener = onPositiveButtonClickListener
        return self

    }

    public func onNegativeButtonClick(onNegativeButtonClickListener: OnNegativeButtonClickListener) -> UpdateMeBuilder {

        self.onNegativeButtonClickListener = onNegativeButtonClickListener
        return self

    }


    public func setPositiveButtonText(title: String) -> UpdateMeBuilder {

        self.positiveButtonText = title
        return self

    }

    public func setPositiveButtonTextColor(color: UIColor) -> UpdateMeBuilder {

        self.positiveButtonTextColor = color
        return self

    }


    public func setNegativeButtonText(title: String) -> UpdateMeBuilder {

        self.negativeButtonText = title
        return self

    }

    public func setNegativeButtonTextColor(color: UIColor) -> UpdateMeBuilder {

        self.negativeButtonTextColor = color
        return self

    }

    public func setFetchInterval(second: Int) -> UpdateMeBuilder {

        self.fetchIntervalInSeconds = second
        return self

    }

    public func setTopColor(color: UInt) -> UpdateMeBuilder {

        self.topColor = color
        return self

    }
    
    public func setDialogIcon(image: UIImage) -> UpdateMeBuilder {
    
        self.dialogIcon = image
        return self
        
    }

    public func setContinueButtonVisibility(visible: Bool) -> UpdateMeBuilder {

        self.continueButtonVisibility = visible
        return self

    }

    public func setDialogVisibility(visible: Bool) -> UpdateMeBuilder {

        self.dialogVisibility = visible
        return self

    }


}
