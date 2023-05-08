//
//  PaginaFerramentas.swift
//  projeto-final
//
//  Created by student on 27/04/23.
//

import SwiftUI

struct Ferramentas: View {
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    NavigationLink {
                        Text("exemplo")
                    } label: {
                        HStack {
                            Image("banner-rosca")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 80, height: 80)
                                .clipShape(Circle())
                                .padding(.trailing)
                            
                            VStack(alignment: .leading) {
                                Text("Vitor")
                                    .font(.title2)
                                    .fontWeight(.medium)
                                
                                HStack {
                                    Text("2,00m")
                                    Text("-")
                                    Text("134kg")
                                }
                            }
                        }
                    }
                }
                
                Section(header: Text("Calculadoras")) {
                    NavigationLink("Taxa Basal") {}
                    NavigationLink("IMC") {}
                    NavigationLink("Água") {}
                }
                
                Section(header: Text("Treino")) {
                    NavigationLink("Timmer") {}
                    NavigationLink("Contador de Séries") {}
                }
            }
            .navigationTitle("Ferramentas")
        }
    }
}

struct Ferramentas_Previews: PreviewProvider {
    static var previews: some View {
        Ferramentas()
    }
}
