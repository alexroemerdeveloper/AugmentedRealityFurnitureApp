//
//  ARFApp.swift
//  ARF
//
//  Created by Alexander Römer on 08.12.20.
//

import SwiftUI

@main
struct ARFApp: App {
    
    @StateObject var placementSettings = PlacementSettings()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(placementSettings)
        }
    }
}
