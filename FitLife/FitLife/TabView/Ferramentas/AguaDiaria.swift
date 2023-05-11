//
//  CalculadoraAgua.swift
//  LoginScreen
//
//  Created by StudentBackup01 on 27/04/23.
//

import SwiftUI

struct AguaDiaria: View {
    @State private var weight = ""
    @State private var waterIntakeString = "0"
    
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.white]), startPoint: .top, endPoint: .bottom).ignoresSafeArea()
            
            VStack {
                Text("Calculadora de Água")
                    .font(.largeTitle)
                    .bold()
                    .padding(.bottom, 50)
                
                VStack{
                    Text(extractNumberFromString(waterIntakeString))
                        .font(.system(size: 100))
                        .foregroundColor(.white)
                        .colorInvert()
                    Text("Litros de água por dia")
                        .font(.title2)
                    
                }.padding(.bottom, 50)
                
                TextField("Peso (kg)", text: $weight, onEditingChanged: { isEditing in
                    if !isEditing {
                        if !isValidInput(weight) {
                            showAlert()
                        }
                    }
                })
                .padding()
                .frame(width: 300, height: 50)
                .background(Color.black.opacity(0.05))
                .cornerRadius(10)
                .keyboardType(.decimalPad) // adiciona o teclado numérico com ponto e vírgula
                
                Button(action: {
                    if isValidInput(weight) {
                        waterIntakeString = calculateWaterIntake()
                    } else {
                        showAlert()
                    }
                }) {
                    Text("Calcular")
                        .foregroundColor(.white)
                        .frame(width: 300, height: 50)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .padding(.top, 20)
                }
                Spacer()
            }.padding(.top, 50).toolbar(.hidden, for: .tabBar)
        }.onTapGesture {
            // Chama a função endEditing para remover o teclado
            UIApplication.shared.endEditing()
        }
    }
    
    private func calculateWaterIntake() -> String {
        if let weight = Float(weight.replacingOccurrences(of: ",", with: ".")) {
            let waterIntake = weight * 35 / 1000 // conversão para litros
            let formatter = NumberFormatter()
            formatter.maximumFractionDigits = 2
            return "Você deve beber pelo menos \(formatter.string(from: NSNumber(value: waterIntake)) ?? "0") litros de água por dia."
        } else {
            return "Por favor, insira um peso válido."
        }
    }
    
    private func extractNumberFromString(_ string: String) -> String {
        let regex = try! NSRegularExpression(pattern: "[0-9]+([.,][0-9]*)?")
        let range = NSRange(location: 0, length: string.utf16.count)
        let match = regex.firstMatch(in: string, range: range)
        if let matchRange = match?.range {
            let matchString = (string as NSString).substring(with: matchRange)
            return matchString
        }
        return "0"
    }
    
    private func isValidInput(_ input: String) -> Bool {
        let regex = try! NSRegularExpression(pattern: "^[0-9,.]*$")
        let range = NSRange(location: 0, length: input.utf16.count)
        let match = regex.firstMatch(in: input, range: range)
        return match != nil
    }
    
    private func showAlert() {
        let alert = UIAlertController(title: "Erro", message: "Insira apenas números, ponto e vírgula no campo de peso.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true, completion: nil)
        }
    }
