//
//  MenuRowViewModelTest.swift
//  takeawayTests
//
//  Created by Krzysztof Jankowski on 28/07/2021.
//

import Foundation
@testable import takeaway
import XCTest

class MenuRowViewModelTests: XCTestCase {
    func testWhenItemIsNotSpicyTextIsItemNameOnly() {
        //        arrange:
                let item = MenuItem.fixture(name: "name", spicy: false)
        //          act:
                let viewModel = MenuRow.ViewModel(item: item)
                
        //        assert:
                XCTAssertEqual(viewModel.text, "name")
    }
    
    func testWhenItemIsSpicyTextIsItemNameAndChilliEmoji() {
        //        arrange:
                let item = MenuItem.fixture(name: "name", spicy: true)
        //          act:
                let viewModel = MenuRow.ViewModel(item: item)
                
        //        assert:
                XCTAssertEqual(viewModel.text, "name🌶")
    }
}

