//
//  SwiftUIView.swift
//  Academia-MVP
//
//  Created by student on 20/04/23.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        TabView {
            SwiftUIView()
                .badge(2)
                .tabItem {
                    Label("Received", systemImage: "tray.and.arrow.down.fill")
                }
        }
    }
    
    struct SwiftUIView_Previews: PreviewProvider {
        static var previews: some View {
            SwiftUIView()
        }
    }
}
