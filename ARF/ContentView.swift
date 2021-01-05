//
//  ContentView.swift
//  ARF
//
//  Created by Alexander Römer on 08.12.20.
//

import SwiftUI
import RealityKit

struct ContentView: View {
    
    @State private var isControlVisible = true
    @State private var showBrwose = false

    var body: some View {
        ZStack(alignment: .bottom) {
            ARViewContainer()
            ControlView(isControlVisible: $isControlVisible, showBrowse: $showBrwose)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct ARViewContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)
        return arView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
