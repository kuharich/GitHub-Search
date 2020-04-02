//
//  SearchUserRow.swift
//  GitHub-Search
//
//  Created by Mark Kuharich on 4/2/20.
//  Copyright © 2020 Mark Kuharich. All rights reserved.
//

import SwiftUI

struct SearchUserRow: View {
    @ObservedObject var viewModel: SearchUserViewModel
    @State var user: User

    var body: some View {
        HStack {
            AsynchronousImageView(
                url: user.avatar_url,
                placeholder: Text("Loading ...")
            ).aspectRatio(contentMode: .fit)
                .frame(width: 44, height: 44)
                .clipShape(Rectangle())
                .overlay(Rectangle().stroke(Color.black, lineWidth: 1))
                .padding(.trailing, 50)
            Text(user.login)
                .font(Font.system(size: 18).bold())
            Spacer()
            }
            .frame(height: 60)
    }
}
