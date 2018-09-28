//
//  NewsViewModel.swift
//  HN
//
//  Created by Tiz on 28/9/18.
//  Copyright © 2018 Software. All rights reserved.
//

import Foundation

protocol NewsViewModelDelegate: AnyObject {

    func refreshView(_ viewModel: NewsViewModel)

}

final class NewsViewModel {

    weak var deleagate: NewsViewModelDelegate?

    var noOfRows: Int {
        return self.items.count
    }

    func item(at indexPath: IndexPath) -> Item {
        return self.items[indexPath.row]
    }

    func update(item: Item?) {
        guard let item = item else {
            return
        }
        self.items.append(item)
        deleagate?.refreshView(self)
    }

    private var items: [Item] = []

}
