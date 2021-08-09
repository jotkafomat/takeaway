//
//  UserDefaults+OrderStoring.swift
//  takeaway
//
//  Created by Krzysztof Jankowski on 09/08/2021.
//

import Foundation

extension UserDefaults: OrderStoring {

    func getOrder() -> Order {
        guard let data = data(forKey: orderKey), let order = try? JSONDecoder().decode(Order.self, from: data) else {
            let order = Order(items: [])
            updateOrder(order)
            return order
        }

        return order
    }

    func updateOrder(_ order: Order) {
        let encoder = JSONEncoder()
        guard let data = try? encoder.encode(order) else { return }
        setValue(data, forKey: orderKey)
    }
}

fileprivate var orderKey = "order"
