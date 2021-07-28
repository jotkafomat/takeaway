//
//  MenuList.ViewModel.swift
//  takeaway
//
//  Created by Krzysztof Jankowski on 28/07/2021.
//

import Foundation

extension MenuList {
    struct ViewModel {
        let sections: [MenuSection]
        
        init(
            menu: [MenuItem],
            menuGrouping: @escaping ([MenuItem]) -> [MenuSection] = groupMenuByCategory) {
        
            self.sections = menuGrouping(menu)
        }
    }
}
