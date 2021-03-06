//
//  MenuItem.swift
//  takeaway
//
//  Created by Krzysztof Jankowski on 27/07/2021.
//

import Foundation

struct MenuItem {
    let name: String
    let category: String
    let spicy: Bool
    let price: Double
}

extension MenuItem: Identifiable {
    var id: String { name }
}

extension MenuItem: Equatable {}

extension MenuItem: Codable {}
