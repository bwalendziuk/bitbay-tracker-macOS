//
//  AppDelegate.swift
//  bitbay
//
//  Created by Bartosz Walendziuk on 12.01.2018.
//  Copyright © 2018 Bartosz Walendziuk. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    let app = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
    var timer = Timer()
    let popover = NSPopover()
    
  
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        let helper = Helper.init()
        let api = ApiController.init()
        
         app.title = "Select"
        
        if let button = app.button {
            //button.image = NSImage(named:NSImage.Name("StatusBarButtonImage"))
            button.action = #selector(togglePopover(_:))
        }
        popover.contentViewController = MenuViewController.freshController()
        
        helper.constructUrl()
        api.getResult()
        
        print(Constants.urls)
    }
    
    @objc func togglePopover(_ sender: Any?) {
        if popover.isShown {
            closePopover(sender: sender)
        } else {
            showPopover(sender: sender)
        }
    }
    
    func showPopover(sender: Any?) {
        if let button = app.button {
            popover.show(relativeTo: button.bounds, of: button, preferredEdge: NSRectEdge.minY)
        }
    }
    
    func closePopover(sender: Any?) {
        popover.performClose(sender)
    }
    
//    func main() {
//        timer = Timer.scheduledTimer(timeInterval: 60, target: self, selector: #selector(self.refreshResult), userInfo: nil, repeats: true)
//    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
}

extension MenuViewController {

    static func freshController() -> MenuViewController {
        let storyboard = NSStoryboard(name: NSStoryboard.Name(rawValue: "Main"), bundle: nil)
        let identifier = NSStoryboard.SceneIdentifier(rawValue: "MenuViewController")
      
        guard let viewcontroller = storyboard.instantiateController(withIdentifier: identifier) as? MenuViewController else {
            fatalError("Why cant i find MenuViewController? - Check Main.storyboard")
        }
        return viewcontroller
    }
}





