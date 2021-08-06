//
//  OrderDetail.swift
//  takeaway
//
//  Created by Krzysztof Jankowski on 05/08/2021.
//

import Foundation
import SwiftUI

struct OrderDetail: View {

    let viewModel: ViewModel

    var body: some View {
        VStack(alignment: .center, spacing: 8) {
            Text(viewModel.headerText)

            if viewModel.menuListItems.isEmpty {
                Text(viewModel.emptyMenuFallbackText).multilineTextAlignment(.center)
            } else {
                List(viewModel.menuListItems) { Text($0.name) }
            }

            if let total = viewModel.totalText {
                Text(total)
            }

            Spacer()
        }
        .padding(8)
    }
}
