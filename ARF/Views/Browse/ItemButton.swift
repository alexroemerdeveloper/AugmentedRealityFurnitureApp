//
//  ItemButton.swift
//  ARF
//
//  Created by Alexander Römer on 19.02.21.
//

import SwiftUI

struct ItemButton: View {
    
    let model: Model
    let action: () -> Void
    
    var body: some View {
        Button(action: {
            action()
        }) {
            Image(uiImage: model.thumbnail)
                .resizable()
                .frame(height: 150)
                .aspectRatio(1/1, contentMode: .fit)
                .background(Color(UIColor.secondarySystemFill))
                .cornerRadius(8)
        }
    }
}
