//
//  MenuFetcher.swift
//  takeaway
//
//  Created by Krzysztof Jankowski on 02/08/2021.
//

import Foundation
import Combine

class MenuFetcher: MenuFetching {
    
    let networkFetching: NetworkFetching
    let baseURL: URL
    
    init(networkFetching: NetworkFetching = URLSession.shared, baseURL: URL = URL(string: "https://raw.githubusercontent.com/mokagio/tddinswift_fake_api/trunk/")!) {
        self.networkFetching = networkFetching
        self.baseURL = baseURL
    }
    
    func fetchMenu() -> AnyPublisher<[MenuItem], Error> {
        let request = URLRequest(url: baseURL.appendingPathComponent("menu_response.json"))
        
        return networkFetching
            .load(request)
            .decode(type: [MenuItem].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
}
