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
        Text(viewModel.text)
    }
}
