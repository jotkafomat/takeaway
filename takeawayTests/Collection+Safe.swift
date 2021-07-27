//
//  Collection+Safe.swift
//  takeaway
//
//  Created by Krzysztof Jankowski on 27/07/2021.
//

import Foundation

extension Collection {
    /// Returns the element at given index if its within range, otherwise nil.
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
