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
}

extension MenuItem: Identifiable {
    var id: String { name }
}
