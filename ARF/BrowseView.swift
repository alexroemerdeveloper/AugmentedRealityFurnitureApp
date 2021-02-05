//
//  BrowseView.swift
//  ARF
//
//  Created by Alexander Römer on 05.01.21.
//

import SwiftUI

struct BrowseView: View {
    
    @Binding var showBrowse: Bool
    
    var body: some View {
        NavigationView {
            ScrollView {
                ModelsByCategoryGrid(showBrowse: $showBrowse)
            }
            .navigationBarTitle(Text("Browse"), displayMode: .large)
            .navigationBarItems(trailing:
                                    Button(action: {
                                        showBrowse.toggle()
                                    }) {
                                        Text("Done").bold()
                                    }
                                
            )
        }
    }
}

struct BrowseView_Previews: PreviewProvider {
    static var previews: some View {
        BrowseView(showBrowse: .constant(false))
    }
}


struct ModelsByCategoryGrid: View {
    @Binding var showBrowse: Bool

    let models = Models()
    
    var body: some View {
        VStack {
            ForEach(ModelCategory.allCases, id: \.self) { category in
                if let modelsByCategory = models.get(category: category) {
                    HorizontalGrid(showBrowse: $showBrowse, title: category.label, items: modelsByCategory)
                }
            }
        }
    }
}


struct HorizontalGrid: View {
    
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
                        ItemButton(model: items[index]) {
                            //call model method to async load Entity
                            //select mdoel for placement
                            items[index].asyncLoadModelEntity()
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


struct Seperator: View {
    var body: some View {
        Divider()
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
    }
}
