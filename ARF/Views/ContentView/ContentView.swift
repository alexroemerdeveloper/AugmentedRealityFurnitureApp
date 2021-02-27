//
//  ContentView.swift
//  ARF
//
//  Created by Alexander Römer on 08.12.20.
//

import SwiftUI
import RealityKit

struct ContentView: View {
    
    @EnvironmentObject var placementSettings: PlacementSettings
    
    @State private var isControlVisible = true
    @State private var showBrwose = false

    var body: some View {
        ZStack(alignment: .bottom) {
            ARViewContainer()
            if placementSettings.selectedModel == nil {
                ControlView(isControlVisible: $isControlVisible, showBrowse: $showBrwose)
            } else {
                PlacementView()
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct ARViewContainer: UIViewRepresentable {
    
    @EnvironmentObject var placementSettings: PlacementSettings
    
    func makeUIView(context: Context) -> CustomARView {
        let arView = CustomARView(frame: .zero)
        self.placementSettings.sceneObserver = arView.scene.subscribe(to: SceneEvents.Update.self, { event in
            //Todo:  Call update scene
            self.updateScene(for: arView)
        })
        return arView
    }
    
    func updateUIView(_ uiView: CustomARView, context: Context) {}
    
    private func updateScene(for arView: CustomARView) {
        //Only display focusEntity wehen the user has selected a model for placement
        arView.focusEntity?.isEnabled = self.placementSettings.selectedModel != nil
        //Add model to scene if confirmed for placement
        if let  confirmedModel = self.placementSettings.confirmedModel, let modelEntity = confirmedModel.modelEntity {
            // Todo: Call place method
            self.place(modelEntity, in: arView)
            self.placementSettings.confirmedModel = nil
        }
    }
    
    private func place(_ modelEntity: ModelEntity, in arView: ARView) {
        //1 Clone modelEntity. This creates an identical copy of ModelEntity and references the same model. This allows us to have multiple models of the same asset on our scene
        let clonedEntity = modelEntity.clone(recursive: true)
        //2 Enable translation and rotation gestures
        clonedEntity.generateCollisionShapes(recursive: true)
        arView.installGesture([.translation, .rotation], for: clonedEntity)
        //3 Create an anchorEntity ans add clonedEntity to the anchor Entity
        let anchorEntity = AnchorEntity(plane: .any)
        anchorEntity.addChild(clonedEntity)
        //4 Add the anchorEntity to the arViewScnene
        arView.scene.addAnchor(anchorEntity)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(PlacementSettings())
    }
}
