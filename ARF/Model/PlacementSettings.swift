//
//  PlacementSettings.swift
//  ARF
//
//  Created by Alexander Römer on 19.02.21.
//

import SwiftUI
import RealityKit
import Combine

class PlacementSettings: ObservableObject {
    
    ///When the user select a model in the browseview, this property is set.
    @Published var selectedModel: Model? {
        willSet {
            print("Setting selectedModel to \(String(describing: newValue?.name))")
        }
    }
    
    ///When the user taps confirmed in the PlacementView,  the value of selectedModel is assigned to confirmedModel
    @Published var confirmedModel: Model? {
        willSet {
            guard let model = newValue else {
                print("Clearing confirmedModel")
                return
            }
            print("Settings confirmedModel \(model.name)")
        }
    }
    
    
    
    
    
    
    
}
