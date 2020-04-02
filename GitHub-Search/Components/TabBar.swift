//
//  TabBar.swift
//  GitHub-Search
//
//  Created by Mark Kuharich on 4/2/20.
//  Copyright © 2020 Mark Kuharich. All rights reserved.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        HStack {
            Spacer()
            Tab(.search, "Search")
            Spacer()
            Tab(.login, "Login")
            Spacer()
            Tab(.settings, "Settings")
            Spacer()
        }
        .backgroundColor(.gray)
    }
}

private struct Tab: View {
    @EnvironmentObject var navigation: NavigationState

    let tab: ApplicationFlow.Tab
    let label: String

    init(_ tab: ApplicationFlow.Tab, _ label: String) {
        self.tab = tab
        self.label = label
    }
    
    var body: some View {
        VStack(spacing: 6) {
            Image((navigation.application.tab == tab ? label + "Icon" : ""))
            .resizable()
            .frame(width: 24, height: 24)
            Text(label)
        }
        .backgroundColor(.gray)
        .onTapGesture {
            self.navigation.application.tab = self.tab
        }
    }
}
