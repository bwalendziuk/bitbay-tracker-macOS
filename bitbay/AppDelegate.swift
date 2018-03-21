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
                if (item.title.contains("BTC")) {
                    if ((results[item.title]) != nil) {
                        temp = temp + " " + item.title + ":" + results[item.title]!
                    }
                } else {
                    if ((results[item.title]) != nil) {
                        temp = temp + " " + item.title + ":" + String(format: "%.2f",(results[item.title]! as NSString).doubleValue)
                    }
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
        urls["GAME/PLN"] = NSURL(string: "https://bitbay.net/API/Public/GAMEPLN/ticker.json")
        urls["BTC/PLN"] = NSURL(string: "https://bitbay.net/API/Public/BTCPLN/ticker.json")
        urls["LSK/PLN"] = NSURL(string: "https://bitbay.net/API/Public/LSKPLN/ticker.json")
        urls["ETH/PLN"] = NSURL(string: "https://bitbay.net/API/Public/ETHPLN/ticker.json")
        urls["LTC/PLN"] = NSURL(string: "https://bitbay.net/API/Public/LTCPLN/ticker.json")
        urls["BCC/PLN"] = NSURL(string: "https://bitbay.net/API/Public/BCCPLN/ticker.json")
        urls["DASH/PLN"] = NSURL(string: "https://bitbay.net/API/Public/DASHPLN/ticker.json")
        urls["BTG/PLN"] = NSURL(string: "https://bitbay.net/API/Public/BTGPLN/ticker.json")
        urls["XRP/PLN"] = NSURL(string: "https://bitbay.net/API/Public/XRPPLN/ticker.json")
        urls["GAME/BTC"] = NSURL(string: "https://bitbay.net/API/Public/GAMEBTC/ticker.json")
        urls["LSK/BTC"] = NSURL(string: "https://bitbay.net/API/Public/LSKBTC/ticker.json")
        urls["ETH/BTC"] = NSURL(string: "https://bitbay.net/API/Public/ETHBTC/ticker.json")
        urls["LTC/BTC"] = NSURL(string: "https://bitbay.net/API/Public/LTCBTC/ticker.json")
        urls["BCC/BTC"] = NSURL(string: "https://bitbay.net/API/Public/BCCBTC/ticker.json")
        urls["DASH/BTC"] = NSURL(string: "https://bitbay.net/API/Public/DASHBTC/ticker.json")
        urls["BTG/BTC"] = NSURL(string: "https://bitbay.net/API/Public/BTGBTC/ticker.json")
        urls["XRP/BTC"] = NSURL(string: "https://bitbay.net/API/Public/XRPBTC/ticker.json")
        urls["XIN/BTC"] = NSURL(string: "https://bitbay.net/API/Public/XINBTC/ticker.json")
        urls["KZC/BTC"] = NSURL(string: "https://bitbay.net/API/Public/KZCBTC/ticker.json")
        urls["GAME/USD"] = NSURL(string: "https://bitbay.net/API/Public/GAMEUSD/ticker.json")
        urls["BTC/USD"] = NSURL(string: "https://bitbay.net/API/Public/BTCUSD/ticker.json")
        urls["LSK/USD"] = NSURL(string: "https://bitbay.net/API/Public/LSKUSD/ticker.json")
        urls["ETH/USD"] = NSURL(string: "https://bitbay.net/API/Public/ETHUSD/ticker.json")
        urls["LTC/USD"] = NSURL(string: "https://bitbay.net/API/Public/LTCUSD/ticker.json")
        urls["BCC/USD"] = NSURL(string: "https://bitbay.net/API/Public/BCCUSD/ticker.json")
        urls["DASH/USD"] = NSURL(string: "https://bitbay.net/API/Public/DASHUSD/ticker.json")
        urls["BTG/USD"] = NSURL(string: "https://bitbay.net/API/Public/BTGUSD/ticker.json")
        urls["XRP/USD"] = NSURL(string: "https://bitbay.net/API/Public/XRPUSD/ticker.json")
    }
    
    func constructMenu() {
        let items = ["GAME/PLN", "BTC/PLN", "LSK/PLN", "ETH/PLN", "LTC/PLN", "BCC/PLN", "DASH/PLN", "BTG/PLN", "XRP/PLN", "GAME/BTC", "LSK/BTC", "ETH/BTC", "LTC/BTC", "BCC/BTC", "DASH/BTC", "BTG/BTC", "XRP/BTC", "XIN/BTC", "KZC/BTC", "GAME/USD", "BTC/USD", "LSK/USD", "ETH/USD", "LTC/USD", "BCC/USD", "DASH/USD", "BTG/USD", "XRP/USD"]
        
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





