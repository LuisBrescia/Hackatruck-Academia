//
//  ContentView.swift
//  projeto-final
//
//  Created by student on 27/04/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            PaginaFicha()
                .tabItem {
                    Label("Ficha Treino", systemImage: "list.bullet.clipboard.fill")
                }
            
            PaginaExercicios()
                .tabItem {
                    Label("Exercícios", systemImage: "dumbbell.fill")
                }
            
            PaginaFerramentas()
                .tabItem {
                    Label("Ferramentas", systemImage: "hammer.circle.fill")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
