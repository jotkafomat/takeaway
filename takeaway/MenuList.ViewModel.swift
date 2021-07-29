//
//  MenuList.ViewModel.swift
//  takeaway
//
//  Created by Krzysztof Jankowski on 28/07/2021.
//

import Foundation
import Combine

extension MenuList {
    class ViewModel: ObservableObject {
        @Published private(set) var sections: [MenuSection]
        
        init(
            menuFetching: MenuFetching,
            menuGrouping: @escaping ([MenuItem]) -> [MenuSection] = groupMenuByCategory) {
        
            self.sections = menuGrouping([])
        }
    }
}
