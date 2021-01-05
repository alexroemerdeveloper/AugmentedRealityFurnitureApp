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
                Text("Hello, World!")
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
