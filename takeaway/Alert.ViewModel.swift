//
//  Alert.ViewModel.swift
//  takeaway
//
//  Created by Krzysztof Jankowski on 09/08/2021.
//

import Foundation
import SwiftUI

extension Alert {
    struct ViewModel: Identifiable {
        let title: String
        let message: String
        let buttonText: String
        
        var id: String {
            title + message + buttonText
        }
        
        let buttonAction: (() -> Void)? 
    }
}
