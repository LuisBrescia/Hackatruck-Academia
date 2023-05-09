//
//  ListaExercios.swift
//  projeto-final
//
//  Created by student on 28/04/23.
//

import SwiftUI

struct ListaExercios: View {
    @State var exercicios: [Exercicio]
    
    var body: some View {
        ScrollView {
            ForEach(exercicios, id: \.self) { exercicio in
                ExercicioFicha(exercicio: exercicio)
                    .frame(width: 250, height: .infinity)
                    .padding()
            }
        }
        .ignoresSafeArea()
        .frame(width: .infinity)
    }
}

struct ListaExercios_Previews: PreviewProvider {
    static var previews: some View {
        let exercicios = [
            Exercicio(
                nome: "Rosca reta",
                series: 3,
                carga: 15,
                anotacao: "Anotação",
                foto: "https://grandeatleta.com.br/wp-content/uploads/2018/07/rosca-direta-barra-reta-ou-w.jpg"
            ),
            Exercicio(
                nome: "Rosca reta direta",
                series: 3,
                carga: 15,
                anotacao: "Anotação",
                foto: "https://grandeatleta.com.br/wp-content/uploads/2018/07/rosca-direta-barra-reta-ou-w.jpg"
            )
        ]
        ListaExercios(exercicios: exercicios)

    }
}
