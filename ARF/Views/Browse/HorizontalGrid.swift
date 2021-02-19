//
//  HorizontalGrid.swift
//  ARF
//
//  Created by Alexander Römer on 19.02.21.
//

import SwiftUI

struct HorizontalGrid: View {
    
    @EnvironmentObject var placementSettings: PlacementSettings
    @Binding var showBrowse: Bool
    
    var title: String
    var items: [Model]
    private let gridItem = [GridItem(.fixed(150))]
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            Seperator()
            
            Text(title)
                .font(.title2)
                .bold()
                .padding(.leading, 22)
                .padding(.top, 10)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: gridItem, spacing: 30) {
                    ForEach(0..<items.count) { index in
                        //                        Color(UIColor.secondarySystemFill)
                        //                            .frame(width: 150, height: 150)
                        //                            .cornerRadius(8)
                        let model = items[index]
                        ItemButton(model: model) {
                            model.asyncLoadModelEntity()
                            placementSettings.selectedModel = model
                            print("BrowseView \(items[index].name)")
                            showBrowse = false
                        }
                    }
                }
                .padding(.horizontal, 22)
                .padding(.vertical, 10)
            }
            
        }
    }
}
