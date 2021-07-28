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
                MenuList(sections: groupMenuByCategory(menu))
                    .navigationTitle("TakeAway")
            }
        }
    }
}

let menu = [
    MenuItem(name: "Caprese Salad", category: "starters", spicy: false),
    MenuItem(name: "Arancini Balls", category: "starters", spicy: false),
    MenuItem(name: "Penne all Arrabbiata", category: "pastas", spicy: false),
    MenuItem(name: "Spaghetti Carbonara", category: "pastas", spicy: true),
    MenuItem(name: "Water", category: "drinks", spicy: false),
    MenuItem(name: "Red Wine", category: "drinks", spicy: false),
    MenuItem(name: "White Wine", category: "drinks", spicy: false),
    MenuItem(name: "Tiramisu", category: "dessert", spicy: false),
    MenuItem(name: "Affogato", category: "dessert", spicy: false)
]

func groupMenuByCategory(_ menu: [MenuItem]) -> [MenuSection] {
    return Dictionary(grouping: menu, by: { $0.category })
        .map { (key: String, value: [MenuItem]) in
            MenuSection(items: value, category: key)
        }
        .sorted { $0.category > $1.category }
}
