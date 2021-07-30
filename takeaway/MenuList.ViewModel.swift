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
        @Published private(set) var sections: Result<[MenuSection], Error> = .success([])
        var cancellable = Set<AnyCancellable>()
        
        init(
            menuFetching: MenuFetching,
            menuGrouping: @escaping ([MenuItem]) -> [MenuSection] = groupMenuByCategory) {
            
            menuFetching
                .fetchMenu()
                .sink(
                    receiveCompletion: {_ in },
                    receiveValue: { [weak self] value in
                        self?.sections = .success(menuGrouping(value))
                })
                .store(in: &cancellable)
        }
    }
}
