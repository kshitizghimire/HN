//
//  UITableView+Extension.swift
//  HN
//
//  Created by Tiz on 29/9/18.
//  Copyright © 2018 Software. All rights reserved.
//

import UIKit

extension UITableView {

    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T where T: ReuseIdentifierProviding {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        return cell
    }

}
