//
//  PaginaFerramentas.swift
//  projeto-final
//
//  Created by student on 27/04/23.
//

import SwiftUI
struct BlueButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color(red:0, green: 0, blue: 1))
            .foregroundColor(.white)
            .clipShape(Capsule()).shadow(color: .black, radius: 2.5)
    }
}

struct PaginaFerramentas: View {
    // Variaveis do IMC
    @State private var peso = 0.0
    @State private var altura = 0.00
    @State private var calculo = false
    @State private var corzinha = "white"
    @State private var name: String = ""
    // Variaveis da Taxa Basal
    @State private var peso2 = 0.0
    @State private var altura2 = 0.00
    @State private var idade = 0.0
    @State private var homem = false
    @State private var mulher = false
    
    
    var body: some View {
        
        let imc = peso/(altura*altura)
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
                    
                    NavigationLink("Taxa Basal") {
                        TextField("Entre seu peso", value: $peso2, format:.number).keyboardType(.decimalPad).textFieldStyle(.roundedBorder).frame(width: 300).shadow(radius: 2.5).foregroundColor(.gray)
                            .multilineTextAlignment(.center).shadow(color: .blue, radius: 2.5)
                   
                        TextField("Entre sua altura", value: $altura2, format:.number).keyboardType(.decimalPad).textFieldStyle(.roundedBorder).frame(width: 300).shadow(radius: 2.5).foregroundColor(.gray)                    .multilineTextAlignment(.center).shadow(color: .blue, radius: 2.5)
                        
                        TextField("Entre sua idade", value: $idade, format:.number).keyboardType(.decimalPad).textFieldStyle(.roundedBorder).frame(width: 300).shadow(radius: 2.5).foregroundColor(.gray)                    .multilineTextAlignment(.center).shadow(color: .blue, radius: 2.5)
                        
                        
                    }
                    NavigationLink("IMC") {
                        ZStack{
                            Image("caminhao")
                                .resizable()
                                .ignoresSafeArea().opacity(0.5)
                            Color("\(corzinha)").ignoresSafeArea()
                            
                            VStack  (spacing:25){
                                Text("Calculadora de IMC").bold().font(.largeTitle).shadow(color: .blue, radius: 2.5)
                                TextField("Entre seu peso", value: $peso, format:.number).keyboardType(.decimalPad).textFieldStyle(.roundedBorder).frame(width: 300).shadow(radius: 2.5).foregroundColor(.gray)
                                    .multilineTextAlignment(.center).shadow(color: .blue, radius: 2.5)
                           
                                TextField("Entre sua altura", value: $altura, format:.number).keyboardType(.decimalPad).textFieldStyle(.roundedBorder).frame(width: 300).shadow(radius: 2.5).foregroundColor(.gray)                    .multilineTextAlignment(.center).shadow(color: .blue, radius: 2.5)
                                
                                Button("Calcular"){
                                    
                                    
                                    if imc<18.5{
                                        corzinha="baixo"
                                        name="Baixo Peso"
                                    }else if imc>18.5&&imc<25.00{
                                        corzinha="normal"
                                        name="Normal"
                                    }else if imc>25.5&&imc<30.00{
                                        corzinha="sobrepeso"
                                        name="Sobre Peso"
                                    } else{
                                        corzinha="obesidade"
                                        name="Obesidade"
                                    }
                                    
                                }.buttonStyle(BlueButton())
                                Spacer()
                                Text("\(name)").font(.largeTitle)
                                Spacer()
                               
                                Image("tabela-IMC").resizable().scaledToFit()
                                
                               
                            }
                        }
                    }
                    NavigationLink("IMC PRO"){
                        ImcProView()
                        
                    }
                    NavigationLink("Água") {
                        WaterCalculatorView()
                    }
                }
                
                Section(header: Text("Treino")) {
                    NavigationLink("Timer") {
                        TimerView()
                    }
                    NavigationLink("Contador de Séries") {}
                }
            }
            .navigationTitle("Ferramentas")
        }
    }
}

struct PaginaFerramentas_Previews: PreviewProvider {
    static var previews: some View {
        PaginaFerramentas()
    }
}
