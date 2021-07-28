//
//  MenuList.swift
//  takeaway
//
//  Created by Krzysztof Jankowski on 27/07/2021.
//

import SwiftUI

struct MenuList: View {
    
    let sections: [MenuSection]
    
    var body: some View {
        List {
            ForEach(sections) { section in
                Section(header: Text(section.category)) {
                    ForEach(section.items) { item in
                        MenuRow(viewModel: MenuRow.ViewModel(item: item))
                    }
                }
            }
        }
    }
}

