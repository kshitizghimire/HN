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
        self.loadData()
    }

   private func loadData() {
        let firebaseRootReference = Database.database().reference(withPath: "v0")
        let topStories = firebaseRootReference.child(Constants.topStories)

        topStories.observeSingleEvent(of: .value, with: { (snapshot) in
            for child in snapshot.children {
                guard
                    let snapshot = child as? DataSnapshot,
                    let value = snapshot.value
                    else {
                        return
                }

                let itemID = "\(Constants.item)/\(value)"

                let itemReference = firebaseRootReference.child(itemID)

                itemReference.observeSingleEvent(of: .value, with: { (snapshot) in
                    self.viewModel.update(item: snapshot.toItem)
                })
            }
        })
    }

    private struct Constants {
        static let topStories = "topstories"
        static let item = "item"
    }

}

extension NewsViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.noOfRows
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: NewsTableViewCell = tableView.dequeueReusableCell(for: indexPath)

        cell.configure(item: self.viewModel.item(at: indexPath))

        return cell
    }

}

extension NewsViewController: NewsViewModelDelegate {

    func refreshView(_ viewModel: NewsViewModel) {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

}
