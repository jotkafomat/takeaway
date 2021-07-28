//
//  MenuItem + Fixture.swift
//  takeawayTests
//
//  Created by Krzysztof Jankowski on 28/07/2021.
//

import Foundation
@testable import takeaway

extension MenuItem {
    static func fixture(name: String = "name", category: String = "category", spicy: Bool = false, price: Double = 1.00) -> MenuItem {
        MenuItem(name: name, category: category, spicy: spicy, price: price)
    }
}
