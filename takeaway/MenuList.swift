//
//  MenuList.swift
//  takeaway
//
//  Created by Krzysztof Jankowski on 27/07/2021.
//

import SwiftUI

struct MenuList: View {
    
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        switch viewModel.sections {
        case .success(let sections):
            List {
                ForEach(sections) { section in
                    Section(header: Text(section.category)) {
                        ForEach(section.items) { item in
                            MenuRow(viewModel: MenuRow.ViewModel(item: item))
                        }
                    }
                }
            }
        case .failure(let error):
            Text("An error occurred")
            Text(error.localizedDescription).italic()
        }
    }
}
