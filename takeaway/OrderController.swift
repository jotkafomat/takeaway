//
//  OrderController.swift
//  takeaway
//
//  Created by Krzysztof Jankowski on 03/08/2021.
//

import Foundation

class OrderController: ObservableObject {
    @Published private(set) var order: Order
    
    private let orderStoring: OrderStoring
    
    init(orderStoring: OrderStoring = UserDefaults.standard) {
        self.orderStoring = orderStoring
        order = orderStoring.getOrder()
    }
    
    func isItemInOrder(_ item: MenuItem) -> Bool {
        order.items.contains(item)
    }
    
    func addToOrder(item: MenuItem) {
        order = Order(items: order.items + [item])
    }
    
    func removeFromOrder(item: MenuItem) {
        guard let itemIndex = order.items.firstIndex(where: { $0.name == item.name } ) else { return }
        
        var orderItemsCopy = order.items
        orderItemsCopy.remove(at: itemIndex)
        
        order = Order(items: orderItemsCopy)
    }
    
    func resetOrder() {
        order = Order(items: [])
    }
    
    func updateOrder(with newOrder: Order) {
        orderStoring.updateOrder(newOrder)
        order = newOrder
    }
}
