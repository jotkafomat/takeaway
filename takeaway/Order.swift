//
//  Order.swift
//  takeaway
//
//  Created by Krzysztof Jankowski on 03/08/2021.
//

import Foundation


struct Order {
    let items: [MenuItem]
    
    var total: Double {
        items.map { $0.price }
            .reduce(0, +)
    }
}

extension Order: Codable, Equatable {}

