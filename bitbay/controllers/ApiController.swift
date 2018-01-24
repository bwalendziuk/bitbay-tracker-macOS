//
//  ApiController.swift
//  bitbay
//
//  Created by Bartosz Walendziuk on 16.01.2018.
//  Copyright © 2018 Bartosz Walendziuk. All rights reserved.
//

import Foundation

class ApiController {
    
    func getResult() {
        
        for item in Constants.altercoins {
                getJsonFromUrl(key: item, url: Constants.urls[item]!)
        }
    }
    
    func getJsonFromUrl(key: String, url: NSURL) {
        URLSession.shared.dataTask(with: (url as URL?)!, completionHandler: {(data, response, error) -> Void in
            if let jsonObj = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? NSDictionary {
               let temp = Coin(
                coin: key,
                max: String(format: "%@", jsonObj?.object(forKey: "max") as! CVarArg),
                min: String(format: "%@", jsonObj?.object(forKey: "min") as! CVarArg),
                last: String(format: "%@", jsonObj?.object(forKey: "last") as! CVarArg),
                bid: String(format: "%@", jsonObj?.object(forKey: "bid") as! CVarArg),
                ask: String(format: "%@", jsonObj?.object(forKey: "ask") as! CVarArg),
                vwap: String(format: "%@", jsonObj?.object(forKey: "vwap") as! CVarArg),
                average: String(format: "%@", jsonObj?.object(forKey: "average") as! CVarArg),
                volume: String(format: "%@", jsonObj?.object(forKey: "volume") as! CVarArg)
                )
                
                print("zmiana")
                NotificationCenter.default.post(name: .addRow, object: nil)
                
            }
        }).resume()
    }
}
