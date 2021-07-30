//
//  MenuItem+JSONFixture.swift
//  takeawayTests
//
//  Created by Krzysztof Jankowski on 30/07/2021.
//

import Foundation
@testable import takeaway

extension MenuItem {
    static func jsonFixture(
        name: String = "a name",
        category: String = "a category",
        spicy: Bool = true,
        price: Double = 1.0
    ) -> String {
        return """
    {
        "name": "\(name)",
        "category": "\(category)",
        "spicy": \(spicy),
        "price": \(price)
    }
    """
    }
}
