//
//  MenuViewController.swift
//  bitbay
//
//  Created by Bartosz Walendziuk on 16.01.2018.
//  Copyright © 2018 Bartosz Walendziuk. All rights reserved.
//

import Cocoa

class MenuViewController: NSViewController {

    @IBOutlet var refresSelect: NSPopUpButton!
    @IBOutlet var coinSelect: NSPopUpButton!
    @IBOutlet var curenncySelect: NSPopUpButton!
    @IBOutlet var tableResults: NSArrayController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
       _ = NotifiactionController(objectToRegister: self);
        
        refresSelect.removeAllItems()
        refresSelect.addItems(withTitles: Constants.refreshElement)
        
        coinSelect.removeAllItems()
        coinSelect.addItems(withTitles: Constants.altercoins)
        
        curenncySelect.removeAllItems()
        curenncySelect.addItems(withTitles: Constants.currencyElement)
    }
    
    @objc(addRow:)
     func addRow(notification: NSNotification) {
        print("peru")
    }
    
}
