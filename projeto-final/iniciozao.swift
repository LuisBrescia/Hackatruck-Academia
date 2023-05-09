//
//  iniciozao.swift
//  projeto-final
//
//  Created by Student21 on 09/05/23.
//

import SwiftUI

struct iniciozao: View {
    var body: some View {
        TabView {
            
            PaginaHome()
                .tabItem {
                    Label("Inicio", systemImage: "house.fill")
                }
            
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

struct iniciozao_Previews: PreviewProvider {
    static var previews: some View {
        iniciozao()
    }
}
