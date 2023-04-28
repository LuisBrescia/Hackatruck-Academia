//
//  PaginaFicha.swift
//  projeto-final
//
//  Created by student on 28/04/23.
//

import SwiftUI

struct PaginaFicha: View {
    var resposta = [
        Ficha(
            nome: "Tríceps & Biceps",
            exercicios: [
                Exercicio(nome: "Rosca reta direta", series: 3, carga: 15, anotacao: "Anotação", foto: "https://grandeatleta.com.br/wp-content/uploads/2018/07/rosca-direta-barra-reta-ou-w.jpg")
            ]
        )
    ]
    var body: some View {
        NavigationView {
            List(resposta, id: \.self) { ficha in
                NavigationLink(ficha.nome) {
                    ListaExercios(exercicios: ficha.exercicios)
                }
            }
            .navigationTitle("Fichas")
        }
    }
}

struct PaginaFicha_Previews: PreviewProvider {
    static var previews: some View {
        PaginaFicha()
    }
}
