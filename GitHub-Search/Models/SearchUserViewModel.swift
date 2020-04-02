//
//  SearchUserViewModel.swift
//  GitHub-Search
//
//  Created by Mark Kuharich on 4/2/20.
//  Copyright © 2020 Mark Kuharich. All rights reserved.
//

import SwiftUI
import Combine

final class SearchUserViewModel: ObservableObject {

    @Published var name = ""

    @Published private(set) var users = [User]()

    private var searchCancellable: Cancellable? {
        didSet { oldValue?.cancel() }
    }

    deinit {
        searchCancellable?.cancel()
    }

    func search() {
        guard !name.isEmpty else {
            return users = []
        }

        var urlComponents = URLComponents(string: "https://api.github.com/search/users")!
        urlComponents.queryItems = [
            URLQueryItem(name: "q", value: name)
        ]

        var request = URLRequest(url: urlComponents.url!)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        searchCancellable = URLSession.shared.dataTaskPublisher(for: request)
            .map { $0.data }
            .decode(type: SearchUserResponse.self, decoder: JSONDecoder())
            .map { $0.items }
            .replaceError(with: [])
            .receive(on: RunLoop.main)
            .assign(to: \.users, on: self)
    }
}
