//
//  NewsTableViewCell.swift
//  HN
//
//  Created by Tiz on 28/9/18.
//  Copyright © 2018 Software. All rights reserved.
//

import UIKit

final class NewsTableViewCell: UITableViewCell, ReuseIdentifierProviding {

    @IBOutlet private weak var title: UILabel!

    func configure(item: Item) {
        self.title.text = item.title
    }

}
