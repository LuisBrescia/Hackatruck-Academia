//
//  ListaPorMusculo.swift
//  Academia-MVP
//
//  Created by student on 20/04/23.
//

import SwiftUI

struct ListaPorMusculo: View {
    let columnLayout = Array(repeating: GridItem(), count: 2)
        
    var target: String
    
    let allColors: [Color] = [.pink, .red, .orange, .yellow, .green, .mint, .teal, .cyan, .blue, .indigo, .purple, .brown, .gray]
    
    var body: some View {
        let viewModel = ViewModel()
        
        ScrollView {
            LazyVGrid(columns: columnLayout) {
                ForEach(viewModel.data, id: \.self) { data in
                    Text(data.name)
                }
            }
        }
        .onAppear {
            viewModel.fetch(target: target)
        }
        .padding()
    }
}

struct ListaPorMusculo_Previews: PreviewProvider {
    static var previews: some View {
        ListaPorMusculo(target: "abductors")
    }
}
