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
                .map(menuGrouping)
                .receive(on: RunLoop.main)
                .sink(
                    receiveCompletion: { [weak self] completion in
                        guard case .failure(let error) = completion else { return }
                        self?.sections = .failure(error)
                    },
                    receiveValue: { [weak self] value in
                        self?.sections = .success(value)
                })
                .store(in: &cancellable)
        }
    }
}
