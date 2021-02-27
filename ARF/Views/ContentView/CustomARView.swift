//
//  CustomARView.swift
//  ARF
//
//  Created by Alexander Römer on 27.02.21.
//

import ReplayKit
import ARKit
import FocusEntity

class CustomARView: ARView {
    
    var focusEntity: FocusEntity?
    
    required init(frame frameRect: CGRect) {
        super.init(frame: frameRect)
        focusEntity = FocusEntity(on: self, focus: .classic)
        configure()
    }
    
    @pbjc required dynamic init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemeted")
    }
    
    private func configure() {
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = [.horizontal, .vertical]
        session.run(config)
    }
}
