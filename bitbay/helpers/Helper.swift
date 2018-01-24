//
//  Helper.swift
//  bitbay
//
//  Created by Bartosz Walendziuk on 16.01.2018.
//  Copyright © 2018 Bartosz Walendziuk. All rights reserved.
//

import Foundation

class Helper {
    func constructUrl() {
        let items = Constants.altercoins
        let curency = Constants.curency
        
        for item in items {
             Constants.urls[item] = NSURL(string: "https://bitbay.net/API/Public/" + item + curency + "/ticker.json")
        }
    }
}
