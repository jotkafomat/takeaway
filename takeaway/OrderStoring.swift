//
//  OrderStoring.swift
//  takeaway
//
//  Created by Krzysztof Jankowski on 09/08/2021.
//

import Foundation

protocol OrderStoring {
    func getOrder() -> Order
    
    func updateOrder(_ order: Order)
}
