//
//  MenuRow.swift
//  takeaway
//
//  Created by Krzysztof Jankowski on 28/07/2021.
//

import SwiftUI

struct MenuRow: View {
    
    let viewModel: MenuRow.ViewModel
    
    var body: some View {
        Text(viewModel.text)
    }
}
