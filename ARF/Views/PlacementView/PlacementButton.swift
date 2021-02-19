//
//  PlacementButton.swift
//  ARF
//
//  Created by Alexander Römer on 19.02.21.
//

import SwiftUI

struct PlacementButton: View {
    
    let systemIconName: String
    let action: () -> Void
    
    var body: some View {
        Button(action: {
            action()
        }) {
            Image(systemName: systemIconName)
                .font(.system(size: 50, weight: .light, design: .default))
                .foregroundColor(.white)
                .buttonStyle(PlainButtonStyle())
        }
        .frame(width: 75, height: 75)
    }
}


