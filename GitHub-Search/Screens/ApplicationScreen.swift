//
//  ApplicationScreen.swift
//  GitHub-Search
//
//  Created by Mark Kuharich on 4/2/20.
//  Copyright © 2020 Mark Kuharich. All rights reserved.
//

import SwiftUI
import SwiftUIX

struct ApplicationScreen: View {
    @EnvironmentObject var navigation: NavigationState
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                Color.white.frame(height: 1)
                SwitchOver(navigation.application.current)
                .case(.tabs) {
                    VStack(spacing: 0) {
                        Color.white.frame(height: 0)
                        SwitchOver(navigation.application.tab)
                            .case(.search) {
                            SearchScreen()
                        }
                        .case(.login) {
                            LoginScreen()
                        }
                        .case(.settings) {
                            SettingsScreen()
                        }
                        .case(.more) {
                            Spacer()
                            .onTapGesture {
                            }
                            Spacer()
                        }
                        Color.white.frame(height: 16)
                        TabBar()
                    }
                }
            }
        }
    }
}

struct ApplicationStart_Previews: PreviewProvider {
    static var previews: some View {
        let navigation = NavigationState()
        return ApplicationScreen().environmentObject(navigation)
    }
}
