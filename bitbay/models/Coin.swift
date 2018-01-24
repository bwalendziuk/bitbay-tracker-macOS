//
//  Coin.swift
//  bitbay
//
//  Created by Bartosz Walendziuk on 16.01.2018.
//  Copyright © 2018 Bartosz Walendziuk. All rights reserved.
//

import Foundation

class Coin: NSObject {
    @objc dynamic var coin: String
    @objc dynamic var max: String
    @objc dynamic var min: String
    @objc dynamic var last: String
    @objc dynamic var bid: String
    @objc dynamic var ask: String
    @objc dynamic var vwap: String
    @objc dynamic var average: String
    @objc dynamic var volume: String
    
    init(coin: String, max: String, min: String, last: String, bid: String, ask: String, vwap: String, average: String, volume: String) {
        self.coin = coin
        self.max = max
        self.min = min
        self.last = last
        self.bid = bid
        self.ask = ask
        self.vwap = vwap
        self.average = average
        self.volume = volume
    }
}

