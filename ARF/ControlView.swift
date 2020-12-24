//
//  ControlView.swift
//  ARF
//
//  Created by Alexander Römer on 24.12.20.
//

import SwiftUI

struct ControlView: View {
    
    @Binding var isControlVisible: Bool

    var body: some View {
        VStack {
            ControlVisibilityButton(isControlVisible: $isControlVisible)
            Spacer()
            
            if isControlVisible {
                ControlButtonBar()

            }
        }
    }
}



struct ControlVisibilityButton: View {
    
    @Binding var isControlVisible: Bool
    
    var body: some View {
        HStack {
            Spacer()
            ZStack {
                Color.black.opacity(0.25)
                Button(action: {
                    print("Controll Visibility tapped")
                    isControlVisible.toggle()
                }) {
                    Image(systemName: isControlVisible ? "rectangle" : "slider.horizontal.below.rectangle")
                        .font(.system(size: 25))
                        .foregroundColor(.white)
                        .buttonStyle(PlainButtonStyle())
                }
            }
            .frame(width: 50, height: 50)
            .cornerRadius(8)
        }
        .padding(.top, 45)
        .padding(.trailing, 20)
    }
}

struct ControlButtonBar: View {
    var body: some View {
        HStack {
            ControlButton(systemItemName: "clock.fill") {
                print("MostRecentlyPlaced button pressed")
            }
            
            Spacer()
            
            ControlButton(systemItemName: "square.grid.2x2") {
                print("Browse button pressed")
            }
            
            Spacer()
            
            ControlButton(systemItemName: "slider.horizontal.3") {
                print("Settings Button pressed")
            }
            
        }
        .frame(maxWidth: 500)
        .padding(30)
        .background(Color.black.opacity(0.25))
    }
}


struct ControlButton: View {
    
    let systemItemName: String
    let action: () -> Void
    
    var body: some View {
        Button(action: {
            action()
        }) {
            Image(systemName: systemItemName)
                .font(.system(size: 35))
                .foregroundColor(.white)
                .buttonStyle(PlainButtonStyle())
        }
        .frame(width: 50, height: 50)
    }
}

