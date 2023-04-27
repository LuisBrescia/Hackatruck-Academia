//
//  PaginaHome.swift
//  projeto-final
//
//  Created by student on 27/04/23.
//

import SwiftUI

struct PaginaHome: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    VStack(alignment: .leading) {
                        Image("banner-rosca")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .cornerRadius(3.0)
                        
                        Text("Braço")
                            .font(.title3)
                            .fontWeight(.medium)
                    }
                    .frame(width: 250, height: 175)
                }
                
            }
            .navigationTitle("Home")
            .padding()
        }
    }
}

struct PaginaHome_Previews: PreviewProvider {
    static var previews: some View {
        PaginaHome()
    }
}
