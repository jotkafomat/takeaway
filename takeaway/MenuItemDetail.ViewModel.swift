//
//  MenuItemDetail.ViewModel.swift
//  takeaway
//
//  Created by Krzysztof Jankowski on 05/08/2021.
//

import Foundation

extension MenuItemDetail {

    struct ViewModel {

        let name: String
        let spicy: String?
        let price: String

        init(item: MenuItem) {
            name = item.name
            spicy = item.spicy ? "Spicy" : .none
            price = "$\(String(format: "%.2f", item.price))"
        }
    }
}
