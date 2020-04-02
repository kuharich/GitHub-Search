//
//  User.swift
//  GitHub-Search
//
//  Created by Mark Kuharich on 4/2/20.
//  Copyright © 2020 Mark Kuharich. All rights reserved.
//

import Foundation
import SwiftUI

struct User: Hashable, Identifiable, Decodable {
    var id: Int64
    var login: String
    var avatar_url: URL
}
