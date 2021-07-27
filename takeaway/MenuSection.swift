//
//  MenuSection.swift
//  takeaway
//
//  Created by Krzysztof Jankowski on 27/07/2021.
//

import Foundation

struct MenuSection {
    let items: [MenuItem]
    let category: String
}

extension MenuSection: Identifiable {
    var id: String { category }
}
