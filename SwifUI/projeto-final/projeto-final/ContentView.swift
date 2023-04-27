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
            Text("View Exemplo")
                .tabItem {
                    Label("Home", systemImage: "figure.run.circle.fill")
                }
            
            Text("View Exemplo")
                .tabItem {
                    Label("Exercícios", systemImage: "dumbbell.fill")
                }
            
            Text("View Exemplo")
                .tabItem {
                    Label("Ficha Treino", systemImage: "list.bullet.clipboard.fill")
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
