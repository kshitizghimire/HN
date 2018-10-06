//
//  UITableView+Extension.swift
//  HN
//
//  Created by Tiz on 29/9/18.
//  Copyright © 2018 Software. All rights reserved.
//

import UIKit

extension UITableView {

    func dequeueReusableCell<T: UITableViewCell & ReuseIdentifierProviding>(_ reuseIdentifierProviding: T.Type, for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: reuseIdentifierProviding.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        return cell
    }
}
