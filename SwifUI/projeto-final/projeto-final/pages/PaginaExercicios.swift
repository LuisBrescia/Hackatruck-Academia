//
//  PaginaExercicios.swift
//  projeto-final
//
//  Created by student on 28/04/23.
//

import SwiftUI

struct PaginaExercicios: View {
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

struct PaginaExercicios_Previews: PreviewProvider {
    static var previews: some View {
        PaginaExercicios()
    }
}
