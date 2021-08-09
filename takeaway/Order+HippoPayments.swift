//
//  Order+HippoPayments.swift
//  takeaway
//
//  Created by Krzysztof Jankowski on 09/08/2021.
//

import Foundation

extension Order {
    var hippoPaymentsPayload: [String: Any] {
        ["items": items.map { $0.name }]
    }
}
