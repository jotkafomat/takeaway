//
//  MenuResponse.swift
//  takeaway
//
//  Created by Krzysztof Jankowski on 30/07/2021.
//

import Foundation

struct MenuResponse {
    let items: [MenuItem]
}

extension MenuResponse: Decodable {}
