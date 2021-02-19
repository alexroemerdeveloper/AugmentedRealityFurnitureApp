//
//  ControlButtonBar.swift
//  ARF
//
//  Created by Alexander Römer on 19.02.21.
//

import SwiftUI

struct ControlButtonBar: View {
    
    @Binding var showBrowse: Bool
    
    var body: some View {
        HStack {
            ControlButton(systemItemName: "clock.fill") {
                print("MostRecentlyPlaced button pressed")
            }
            
            Spacer()
            
            ControlButton(systemItemName: "square.grid.2x2") {
                print("Browse button pressed")
                self.showBrowse.toggle()

            }
            .sheet(isPresented: $showBrowse, content: {
                BrowseView(showBrowse: $showBrowse)
            })
            
            Spacer()
            
            ControlButton(systemItemName: "slider.horizontal.3") {
            }
            
        }
        .frame(maxWidth: 500)
        .padding(30)
        .background(Color.black.opacity(0.25))
    }
}
