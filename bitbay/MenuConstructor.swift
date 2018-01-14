//
//  MenuConstructor.swift
//  bitbay
//
//  Created by Bartosz Walendziuk on 13.01.2018.
//  Copyright © 2018 Bartosz Walendziuk. All rights reserved.
//

import Cocoa

class MenuConstructor: NSObject {
    func constructMenu() {
        let game = NSMenuItem()
        game.title = "Game"
        game.target = self
        game.action = #selector(gameAction)
        game.onStateImage = NSImage(named:NSImage.Name("check"))
        menu.addItem(game)
        app.menu = menu
    }
}
