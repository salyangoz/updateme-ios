//
//  ViewController.swift
//  UpdateMeSample
//
//  Created by ALI KIRAN on 8/9/17.
//  Copyright © 2017 ALI KIRAN. All rights reserved.
//

import UIKit
import UpdateMe
import SCLAlertView

class ViewController: UIViewController,OnPositiveButtonClickListener,OnNegativeButtonClickListener,OnUpdateNeededListener {

    func onPositiveClick(dialog: SCLAlertView) {
        print("Positive Clicked")
    }
    
    
    func onNegativeClick(dialog: SCLAlertView) {
        print("Negative Clicked")
    }
    
    func onUpdateNeeded(settings: Settings) {
        print("Popup showed and update needed")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func viewDidAppear(_ animated: Bool) {
        
        //Basic Usage
        
        //UpdateMe.with().build().check()
        
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

}

