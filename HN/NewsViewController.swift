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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let firebaseRef = Database.database().reference(withPath: "v0")
        let topStories = firebaseRef.child("topstories")
        topStories.observe(.value) { (snapshot) in
            print(snapshot)
        }
        
        
        
    }
    
    private struct Constants {
        static let firebaseRef = "https://hacker-news.firebaseio.com/"
    }
}

extension NewsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: NewsTableViewCell.self), for: indexPath)
        return cell
    }
}
