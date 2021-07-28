//
//  MenuSection + Fixture.swift
//  takeawayTests
//
//  Created by Krzysztof Jankowski on 28/07/2021.
//

import Foundation
@testable import takeaway

extension MenuSection {
    static func fixture(
        items: [MenuItem] = [.fixture()],
        category: String = "a category") -> MenuSection {
        MenuSection(items: items, category: category)
    }
}
