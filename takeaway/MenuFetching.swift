//
//  MenuFetching.swift
//  takeaway
//
//  Created by Krzysztof Jankowski on 29/07/2021.
//

import Foundation
import Combine

protocol MenuFetching {
    func fetchMenu() -> AnyPublisher<[MenuItem], Error>
}
