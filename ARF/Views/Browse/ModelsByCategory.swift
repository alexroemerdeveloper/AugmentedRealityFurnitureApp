//
//  ModelsByCategory.swift
//  ARF
//
//  Created by Alexander Römer on 19.02.21.
//

import SwiftUI

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
