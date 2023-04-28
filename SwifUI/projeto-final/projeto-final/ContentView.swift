//
//  ContentView.swift
//  projeto-final
//
//  Created by student on 27/04/23.
//

import SwiftUI

struct ContentView: View {
    @State private var exibeAdicionarFicha = false
    var body: some View {
        TabView {
            NavigationView {
                PaginaFicha()
                    .navigationBarTitle("Ficha Treino")
                    .navigationBarItems(trailing: Button(action: {
                        self.exibeAdicionarFicha = true
                    }) {
                        Image(systemName: "plus")
                    })
            }
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
        .sheet(isPresented: $exibeAdicionarFicha) {
            AdicionarFicha()
        }
    }

}


struct AdicionarFicha: View {
    @State private var nomeFicha = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Informações da Ficha")) {
                    TextField("Nome da Ficha", text: $nomeFicha)
                    
                }
                
                Section {
                    Button(action: {
                        // Aqui você pode implementar o código para salvar as informações da ficha
                    }) {
                        Text("Salvar")
                    }
                }
            }
            .navigationBarTitle("Adicionar Ficha")
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
