//
//  ControlView.swift
//  ARF
//
//  Created by Alexander Römer on 24.12.20.
//

import SwiftUI

struct ControlView: View {
    
    @Binding var isControlVisible: Bool
    @Binding var showBrowse: Bool

    var body: some View {
        VStack {
            ControlVisibilityButton(isControlVisible: $isControlVisible)
            Spacer()
            
            if isControlVisible {
                ControlButtonBar(showBrowse: $showBrowse)
            }
        }
    }
}






