//  ImcCalculatorView.swift
//  LoginScreen
//
//  Created by StudentBackup01 on 27/04/23.
//

import SwiftUI

struct CalculadoraIMC: View {
    @State private var weight = ""
    @State private var height = ""
    @State private var imc = "IMC"
    @State private var background = Color("Background")
    
    private var isValidInput: Bool {
        if let weight = Double(weight), let height = Double(height), weight > 0, height > 0 {
            return true
        }
        return false
    }
    
    private func showAlert() {
        let alert = UIAlertController(title: "Erro", message: "Preencha com valores válidos", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true)
    }
    
    private func calculateImc() {
        guard let weight = Double(weight), let height = Double(height), weight > 0, height > 0 else {
            showAlert()
            return
        }
        
        let alturaAoQuadrado = weight/pow(height, 2)
        
        switch alturaAoQuadrado {
        case 0...18.5:
            background = Color("Baixo peso")
            imc = "Baixo peso"
        case 18.5..<25:
            background = Color("Normal")
            imc = "Normal"
        case 25..<30:
            background = Color("Sobrepeso")
            imc = "Sobrepeso"
        default:
            background = Color("Obesidade")
            imc = "Obesidade"
        }
    }
    
    var body: some View {
        ZStack{
            VStack {
                Text("Calculadora de IMC")
                    .font(.largeTitle)
                    .bold()
                    .padding(.bottom, 60)
                    .padding(.top, 60)
                
                VStack {
                    Text(imc)
                        .font(.title)
                        .bold()
                    Spacer()
                }
                .padding(.bottom, 50)
                VStack{
                    TextField("Altura (metros)", text: $height)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .keyboardType(.decimalPad)
                    
                    TextField("Peso (kg)", text: $weight)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .keyboardType(.decimalPad)
                }.onTapGesture {
                    // Chama a função endEditing para remover o teclado
                    UIApplication.shared.endEditing()
                }
                
                Button(action: calculateImc) {
                    Text("Calcular")
                        .font(.title2)
                        .foregroundColor(.white)
                        .frame(width: 150, height: 50)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding(.top, 50)
                
                Spacer()
                
                Image("tabela-IMC")
                    .resizable()
                    .scaledToFit()
            }
            .padding()
        }.background(background.edgesIgnoringSafeArea(.all))
            .toolbar(.hidden, for: .tabBar).onTapGesture {
                // Chama a função endEditing para remover o teclado
                UIApplication.shared.endEditing()
            }
    }
}


struct ImcCalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculadoraIMC()
    }
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
