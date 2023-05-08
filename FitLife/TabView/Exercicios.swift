//
//  Exercicios.swift
//  FitLife
//
//  Created by Student15 on 08/05/23.
//

import SwiftUI

struct Exercicios: View {
    
    @State var searchText = ""
    
    var body: some View {
        
        NavigationView {
            List {
                Section("Superiores") {
                    NavigationLink("Costas") {}
                    NavigationLink("Peitoral") {}
                    NavigationLink("Ombros") {}
                    NavigationLink("Tríceps") {}
                    NavigationLink("Antebraço") {}
                    NavigationLink("Bíceps") {}
                }
                
                Section("Inferiores") {
                    NavigationLink("Quadríceps") {}
                    NavigationLink("Panturrilha") {}
                    NavigationLink("Glúteos") {}
                }
                
                Section("Outros") {
                    NavigationLink("Abdômen") {}
                }
            }
            .navigationTitle("Exercícios")
            .searchable(text: $searchText)
            
        }
    }
}

struct Exercicios_Previews: PreviewProvider {
    static var previews: some View {
        Exercicios()
    }
}
