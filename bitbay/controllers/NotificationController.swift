//
//  NotificationController.swift
//  bitbay
//
//  Created by Bartosz Walendziuk on 16.01.2018.
//  Copyright © 2018 Bartosz Walendziuk. All rights reserved.
//

import Foundation

class NotifiactionController {
    init(objectToRegister: AnyObject) {
        print("init")
        let sel = Selector("addRow:")
        NotificationCenter.default.addObserver(objectToRegister,
                                               selector: sel,
                                               name: .addRow,
                                               object: nil)
    }
}

extension Notification.Name {
    static let addRow = Notification.Name("addRow")
}
