//
//  OrderButton.swift
//  takeaway
//
//  Created by Krzysztof Jankowski on 05/08/2021.
//

import Foundation
import SwiftUI

struct OrderButton: View {

    let viewModel: ViewModel

    @State private(set) var showingDetail: Bool = false

    var body: some View {
        Button {
            self.showingDetail.toggle()
        } label: {
            Text(viewModel.text)
                .font(Font.callout.bold())
                .padding(12)
                .foregroundColor(.white)
                .background(Color.red)
                .cornerRadius(10.0)
        }
        .sheet(isPresented: $showingDetail) {
            OrderDetail(viewModel: .init())
        }
    }
}
