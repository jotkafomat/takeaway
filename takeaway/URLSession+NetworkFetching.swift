//
//  URLSession+NetworkFetching.swift
//  takeaway
//
//  Created by Krzysztof Jankowski on 02/08/2021.
//

import Foundation
import Combine

extension URLSession: NetworkFetching {
    func load(_ request: URLRequest) -> AnyPublisher<Data, URLError> {
        return dataTaskPublisher(for: request)
            .map { $0.data }
            .eraseToAnyPublisher()
    }
}
