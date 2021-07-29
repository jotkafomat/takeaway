//
//  takeawayApp.swift
//  takeaway
//
//  Created by Krzysztof Jankowski on 27/07/2021.
//

import SwiftUI

@main
struct takeawayApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                MenuList(viewModel: MenuList.ViewModel(menuFetching: MenuFetchingPlaceholder()))
                    .navigationTitle("TakeAway")
            }
        }
    }
}

let menu = [
    MenuItem(name: "Caprese Salad", category: "starters", spicy: false, price: 8.00),
    MenuItem(name: "Arancini Balls", category: "starters", spicy: false, price: 12.00),
    MenuItem(name: "Penne all Arrabbiata", category: "pastas", spicy: true, price: 15.00),
    MenuItem(name: "Spaghetti Carbonara", category: "pastas", spicy: true, price: 15.00),
    MenuItem(name: "Water", category: "drinks", spicy: false, price: 1.00),
    MenuItem(name: "Red Wine", category: "drinks", spicy: false, price: 7.00),
    MenuItem(name: "White Wine", category: "drinks", spicy: false, price: 7.00),
    MenuItem(name: "Tiramisu", category: "dessert", spicy: false, price: 10.00),
    MenuItem(name: "Affogato", category: "dessert", spicy: false, price: 10.00)
]

func groupMenuByCategory(_ menu: [MenuItem]) -> [MenuSection] {
    return Dictionary(grouping: menu, by: { $0.category })
        .map { (key: String, value: [MenuItem]) in
            MenuSection(items: value, category: key)
        }
        .sorted { $0.category > $1.category }
}
