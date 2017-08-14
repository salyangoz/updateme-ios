UpdateMe
--------

[![Version](https://img.shields.io/cocoapods/v/UpdateMe.svg?style=flat)](http://cocoapods.org/pods/UpdateMe)
[![License](https://img.shields.io/cocoapods/l/UpdateMe.svg?style=flat)](http://cocoapods.org/pods/UpdateMe)
[![Platform](https://img.shields.io/cocoapods/p/UpdateMe.svg?style=flat)](http://cocoapods.org/pods/UpdateMe)

A powerful force update library for Swift. 
![alt text](http://www.salyangoz.com.tr/updateme/sample-ios.png)

You can set Version of your app remote and show dialog to force update your app whenever you want.

Requirements
--------

In order to use this library you need to create Firebase project and add RemoteConfig parameters. Configuration showed in Introduction section.

Installation
--------

UpdateMe is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "UpdateMe"
```

Introduction
--------

1. Create Firebase project http://firebase.google.com 
2. Firebase will give you google-services.json file. Paste this file into your projects root directory.
3. In the left menu choose remote config and add these parameters.
4. Add these parameters

| Parameter Key  | Default Value |
| ------------- | ------------- |
| ios_update_me_required  | Do you want to force update App (Ex: false|true)  |
| ios_update_me_current_version  | The version of your app(Ex: 1.0.0)  |
| ios_update_me_store_url  | The store url(Ex: http://play.google.com/store/apps/com.salyangoz.torrentfinder)  |
| ios_update_me_dialog_title  | Update dialog title(You can leave blank)  |
| ios_update_me_dialog_description  | Update dialog message(You can leave blank)  |


Usage
--------

###### Basic Usage

You should add this code block in View Controller's viewDidAppear function.

```groovy
override func viewDidAppear(_ animated: Bool) {
        
        //Basic Usage
        UpdateMe.with().build().check()

}
```

###### Advanced Usage
Features
1. Set dialog visibility
2. Add listeners to Positive and Negative button clicks. 
3. Set positive and negative button text and colors. 
4. Set custom icon 

```groovy
override func viewDidAppear(_ animated: Bool) {
        
        //Advanced Usage
        
        let update:UpdateMe = UpdateMe.with(fetchIntervalInSeconds: 30)
            .setDialogIcon(image: UIImage(named: "info.png")!)
            .setTopColor(color: 0xDF5745)
            .onPositiveButtonClick(onPositiveButtonClickListener: self)
            .onNegativeButtonClick(onNegativeButtonClickListener: self)
            .onUpdateNeeded(onUpdateNeededListener: self)
            .setContinueButtonVisibility(visible: true)
            .setPositiveButtonText(title: "Update")
            .setPositiveButtonTextColor(color: UIColor.orange)
            .build()
        update.check()
        

}
```

Special Thanks
--------
Custom alert dialogs pulled from SCLAlertView for Swift repository. https://github.com/vikmeup/SCLAlertView-Swift


## Author

Salyangoz Co. , info@salyangoz.com.tr


## License

UpdateMe is available under the MIT license. See the LICENSE file for more info.
