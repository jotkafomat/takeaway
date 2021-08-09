//
//  EventLogging.swift
//  takeaway
//
//  Created by Krzysztof Jankowski on 09/08/2021.
//

import Foundation

protocol EventLogging {

    func log(name: String, properties: [String: Any])
}
