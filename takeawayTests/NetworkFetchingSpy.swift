//
//  NetworkFetchingSpy.swift
//  takeawayTests
//
//  Created by Krzysztof Jankowski on 07/09/2021.
//

import Foundation
@testable import takeaway
import Combine

class NetworkFetchingSpy: NetworkFetching {
    
    private(set) var request: URLRequest?
    
    func load(_ request: URLRequest) -> AnyPublisher<Data, URLError> {
        self.request = request
        
        return Result<Data, URLError>
            .failure(URLError(.badURL))
            .publisher
            .delay(for: 0.01, scheduler: RunLoop.main)
            .eraseToAnyPublisher()
    }
    
}
