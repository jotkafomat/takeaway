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
    MenuItem(name: "Caprese Salad", category: "starters"),
    MenuItem(name: "Arancini Balls", category: "starters"),
    MenuItem(name: "Penne all Arrabbiata", category: "pastas"),
    MenuItem(name: "Spaghetti Carbonara", category: "pastas"),
    MenuItem(name: "Water", category: "drinks"),
    MenuItem(name: "Red Wine", category: "drinks"),
    MenuItem(name: "White Wine", category: "drinks"),
    MenuItem(name: "Tiramisu", category: "dessert"),
    MenuItem(name: "Affogato", category: "dessert")
]

func groupMenuByCategory(_ menu: [MenuItem]) -> [MenuSection] {
    return Dictionary(grouping: menu, by: { $0.category })
        .map { (key: String, value: [MenuItem]) in
            MenuSection(items: value, category: key)
        }
        .sorted { $0.category > $1.category }
}
