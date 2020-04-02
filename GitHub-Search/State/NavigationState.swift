//
//  NavigationState.swift
//  GitHub-Search
//
//  Created by Mark Kuharich on 4/2/20.
//  Copyright © 2020 Mark Kuharich. All rights reserved.
//

import SwiftUI

protocol Flow {
    mutating func pop()
}

struct ApplicationFlow: Flow {
    enum Tab {
        case search
        case login
        case settings
        case more
    }
    
    var tab: Tab = .search

    func isTab(_ tab: Tab) -> Bool {
        self.tab == tab
    }

    enum Step {
        case tabs
        case start
    }
    
    var alert: Bool = false
    var importPhoto: Bool = false

    var stack: [Step] = [ .tabs ]

    var current: Step? {
        stack.last
    }
    
    mutating func push(_ step: Step) {
        stack.append(step)
    }

    mutating func pop() {
        let _ = stack.popLast()
    }
}

class NavigationState: ObservableObject {
    @Published var application = ApplicationFlow()
}
