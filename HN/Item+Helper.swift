//
//  Item+Helper.swift
//  HN
//
//  Created by Tiz on 28/9/18.
//  Copyright © 2018 Software. All rights reserved.
//

import Foundation
import FirebaseDatabase

extension DataSnapshot {

    var toItem: Item? {
        guard
            let value = self.value as? [String: AnyObject],
            let title = value["title"] as? String
            else {
                return nil
        }
        return Item(title: title)
    }
}
