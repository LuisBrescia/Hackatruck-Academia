//
//  ContentView.swift
//  Academia-MVP
//
//  Created by student on 20/04/23.
//

import SwiftUI

struct ContentView: View {
    @State var searchText = ""
    
    var body: some View {
        
        NavigationView {
            
            List {
                Section("Superiores") {
                    NavigationLink("Costas") {ListaPorMusculo(target: "lats")}
                    NavigationLink("Peitoral") {ListaPorMusculo(target: "pectorals")}
                    NavigationLink("Ombros") {ListaPorMusculo(target: "upper back")}
                    NavigationLink("Tríceps") {ListaPorMusculo(target: "triceps")}
                    NavigationLink("Antebraço") {ListaPorMusculo(target: "forearms")}
                    NavigationLink("Bíceps") {ListaPorMusculo(target: "biceps")}
                }
                
                Section("Inferiores") {
                    NavigationLink("Quadríceps") {ListaPorMusculo(target: "quads")}
                    NavigationLink("Panturrilha") {ListaPorMusculo(target: "calves")}
                    NavigationLink("Glúteos") {ListaPorMusculo(target: "glutes")}
                }
                
                Section("Outros") {
                    NavigationLink("Abdômen") {ListaPorMusculo(target: "abs")}
                }
            }
            .navigationTitle("Exercícios")
            .searchable(text: $searchText)
            
        }
        
    }
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
