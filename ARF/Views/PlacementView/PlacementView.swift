//
//  PlacementView.swift
//  ARF
//
//  Created by Alexander Römer on 19.02.21.
//

import SwiftUI

struct PlacementView: View {
    
    @EnvironmentObject var placementSettings: PlacementSettings

    var body: some View {
        HStack {
            Spacer()
            PlacementButton(systemIconName: "xmark.circle.fill") {
                print("Cancel PlacementButton pressed")
                placementSettings.selectedModel = nil
            }
            Spacer()
            PlacementButton(systemIconName: "checkmark.circle.fill") {
                print("Confirmed PlacementButton pressed")
                placementSettings.confirmedModel = placementSettings.selectedModel
                placementSettings.selectedModel = nil
            }
            Spacer()
        }
        .padding(.bottom, 30)
    }
}

struct PlacementView_Previews: PreviewProvider {
    static var previews: some View {
        PlacementView()
    }
}
