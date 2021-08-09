//
//  OrderDetail.swift
//  takeaway
//
//  Created by Krzysztof Jankowski on 05/08/2021.
//

import Foundation
import SwiftUI

struct OrderDetail: View {

   @ObservedObject private(set) var viewModel: ViewModel

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
            
            Button {
                viewModel.checkout()
            } label: {
                Text(viewModel.checkoutButtonText)
                    .font(Font.callout.bold())
                    .padding(12)
                    .foregroundColor(.white)
                    .background(Color.red)
                    .cornerRadius(10.0)
            }

        }
        .padding(8)
        .alert(item: $viewModel.alertToShow) { alertViewModel in
            Alert(
                title: Text(alertViewModel.title),
                message: Text(alertViewModel.message),
                dismissButton: .default(
                    Text(alertViewModel.buttonText)
                )
            )
        }
    }
}
