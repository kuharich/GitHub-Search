//
//  SearchUserResponse.swift
//  GitHub-Search
//
//  Created by Mark Kuharich on 4/2/20.
//  Copyright © 2020 Mark Kuharich. All rights reserved.
//

struct SearchUserResponse: Decodable {
    var items: [User]
}
