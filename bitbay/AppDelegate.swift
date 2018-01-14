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
    let menu = NSMenu()
    var urls = [String: NSURL]()
    var results = [String: String]()
    var timer = Timer()
    
  
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        app.title = "Select"
        constructMenu()
        constructUrl()
        main()
    }
    
    func main() {
        timer = Timer.scheduledTimer(timeInterval: 60, target: self, selector: #selector(self.refreshResult), userInfo: nil, repeats: true)
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    func bulidTitle() {
        var temp = ""
        for item in menu.items {
            if (item.state == NSControl.StateValue.on) {
                if ((results[item.title]) != nil) {
                    temp = temp + " " + item.title + ":" + results[item.title]!
                }
            }
        }
        app.title = temp
    }
    
    @objc func refreshResult() {
        var i = 0;
        for item in menu.items {
            if (item.state == NSControl.StateValue.on) {
                getJsonFromUrl(key: item.title, url: urls[item.title]!)
            } else {
                i += i
            }
        }
        
        if (i == 0) {
            app.title = "Select"
        }
    }
    
    func getJsonFromUrl(key: String, url: NSURL) {
        if ReachabilityTest.isConnectedToNetwork() {
            URLSession.shared.dataTask(with: (url as URL?)!, completionHandler: {(data, response, error) -> Void in
                if let jsonObj = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? NSDictionary {
                    self.results[key] =  String(format: "%@", jsonObj!.value(forKey: "last") as! CVarArg)
                    self.bulidTitle()
                }
            }).resume()
            }
    }
    
    func constructUrl() {
        urls["GAME"] = NSURL(string: "https://bitbay.net/API/Public/GAMEPLN/ticker.json")
        urls["BTC"] = NSURL(string: "https://bitbay.net/API/Public/BTCPLN/ticker.json")
        urls["LSK"] = NSURL(string: "https://bitbay.net/API/Public/LSKPLN/ticker.json")
        urls["ETH"] = NSURL(string: "https://bitbay.net/API/Public/ETHPLN/ticker.json")
        urls["LTC"] = NSURL(string: "https://bitbay.net/API/Public/LTCPLN/ticker.json")
        urls["BCC"] = NSURL(string: "https://bitbay.net/API/Public/BCCPLN/ticker.json")
        urls["DASH"] = NSURL(string: "https://bitbay.net/API/Public/DASHPLN/ticker.json")
        urls["BTG"] = NSURL(string: "https://bitbay.net/API/Public/BTGPLN/ticker.json")
    }
    
    func constructMenu() {
        let items = ["GAME", "BTC", "LSK", "ETH", "LTC", "BCC", "DASH", "BTG"]
        
        for item in items {
            generateMenuItem(key: item)
        }
        
        menu.addItem(NSMenuItem.separator())
        menu.addItem(NSMenuItem(title: "Quit", action: #selector(NSApplication.terminate(_:)), keyEquivalent: ""))
    
        app.menu = menu
    }
    
    @objc func menuItemAction(menuItem: NSMenuItem) {
        
        if (menuItem.state == NSControl.StateValue.on) {
            menuItem.state = NSControl.StateValue.off
        } else {
            menuItem.state = NSControl.StateValue.on
        }
        
        refreshResult()
    }
    
    func generateMenuItem(key: String) {
        let temp = NSMenuItem()
        temp.title = key
        temp.target = self
        temp.action = #selector(menuItemAction(menuItem:))
        temp.onStateImage = NSImage(named:NSImage.Name("check"))
        menu.addItem(temp)
    }
}





