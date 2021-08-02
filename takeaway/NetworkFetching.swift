//
//  NetworkFetching.swift
//  takeaway
//
//  Created by Krzysztof Jankowski on 02/08/2021.
//

import Foundation
import Combine

protocol NetworkFetching {
    func load(_ request: URLRequest) -> AnyPublisher<Data, URLError>
}
