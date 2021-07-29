//
//  MenuFetchingPlaceholder.swift
//  takeaway
//
//  Created by Krzysztof Jankowski on 29/07/2021.
//

import Foundation
import Combine

class MenuFetchingPlaceholder: MenuFetching {
    func fetchMenu() -> AnyPublisher<[MenuItem], Error> {
        return Future { $0(.success(menu)) }
            // use a delay to simulate async fetch
            .delay(for: 0.5, scheduler: RunLoop.main)
            .eraseToAnyPublisher()
    }
}
