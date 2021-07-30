//
//  XCTestCase+Json.swift
//  takeawayTests
//
//  Created by Krzysztof Jankowski on 30/07/2021.
//

import Foundation
import XCTest

extension XCTestCase {
    func dataFromJSONFileNamed(_ name: String) throws -> Data {
        let url = try XCTUnwrap(
            Bundle(for: type(of: self)).url(forResource: name, withExtension: "json")
        )
        return try Data(contentsOf: url)
    }
}
