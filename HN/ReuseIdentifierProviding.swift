//
//  ReuseIdentifierProviding.swift
//  HN
//
//  Created by Tiz on 28/9/18.
//  Copyright © 2018 Software. All rights reserved.
//

protocol ReuseIdentifierProviding {

    static var reuseIdentifier: String { get }

}

extension ReuseIdentifierProviding {

    static var reuseIdentifier: String {
        return String(describing: Self.self)
    }

}
