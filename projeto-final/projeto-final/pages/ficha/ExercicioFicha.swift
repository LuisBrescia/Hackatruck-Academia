//
//  ExercicioFicha.swift
//  projeto-final
//
//  Created by student on 28/04/23.
//

import SwiftUI

struct ExercicioFicha: View {
    @State var exercicio: Exercicio
    @State private var showingSheet = false
    @State private var isOn = false
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: exercicio.foto)) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(8.0)
            } placeholder: {
                ProgressView()
            }
            .frame(width: 250, height: 250)
            
            VStack(alignment: .leading) {
                Text(exercicio.nome)
                    .font(.title)
                    .fontWeight(.bold)
                
                HStack {
                    Text("\(exercicio.series)x")
                    Text("-")
                    Text(String(format: "%.1fkg", exercicio.carga))
                }
                
                Button("Anotação") {
                    showingSheet.toggle()
                }
                .sheet(isPresented: $showingSheet) {
                    Text(exercicio.anotacao)
                        .presentationDetents([.medium, .large])
                }
                
                Toggle("Feito: ", isOn: $isOn)
            }
            
        }
    }
}

struct ExercicioFicha_Previews: PreviewProvider {
    static var previews: some View {
        let exercicio = Exercicio(
            nome: "Rosca reta direta",
            series: 3,
            carga: 15,
            anotacao: "Anotação",
            foto: "https://grandeatleta.com.br/wp-content/uploads/2018/07/rosca-direta-barra-reta-ou-w.jpg"
        )
        ExercicioFicha(exercicio: exercicio)
    }
}
