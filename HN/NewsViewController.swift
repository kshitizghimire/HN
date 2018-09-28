//
//  NewsViewController.swift
//  HN
//
//  Created by Tiz on 28/9/18.
//  Copyright © 2018 Software. All rights reserved.
//

import UIKit
import FirebaseDatabase

final class NewsViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    var viewModel: NewsViewModel

    required init?(coder aDecoder: NSCoder) {
        self.viewModel = NewsViewModel()

        super.init(coder: aDecoder)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        self.viewModel.deleagate = self
        self.tableView.register(NewsTableViewCell.self, forCellReuseIdentifier: NewsTableViewCell.reuseIdentifier)

        let firebaseRootReference = Database.database().reference(withPath: "v0")
        let topStories = firebaseRootReference.child(Constants.topStories)
        topStories.observe(.value) { (snapshot) in
            for child in snapshot.children {

                guard
                    let snapshot = child as? DataSnapshot,
                    let value = snapshot.value
                    else { return }

                let itemID = "item/\(value)"
                var items: [Item?] = []
                let itemReference = firebaseRootReference.child(itemID)
                itemReference.observe(.value, with: { (item) in
                    items.append(item.toItem)
                })

                self.viewModel.update(items: items.compactMap { $0 })
            }
        }

    }

    private struct Constants {
        static let topStories = "topstories"
    }
}

extension NewsViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.noOfRows
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.reuseIdentifier, for: indexPath) as! NewsTableViewCell

        cell.configure(item: self.viewModel.item(at: indexPath))

        return cell
    }
}

extension NewsViewController: NewsViewModelDelegate {
    func refreshView(_ viewModel: NewsViewModel) {
        self.tableView.reloadData()
    }
}
