//  ImcProView.swift
//  LoginScreen
//
//  Created by StudentBackup01 on 27/04/23.
//
import SwiftUI

import SwiftUI

struct ImcProView: View {
    
    //variaveis
    
    @State private var weight = ""
    @State private var height = ""
    @State private var age = ""
    @State private var sex = 0 // 0 para masculino, 1 para feminino
    @State private var bodyFatPercentage = ""
    @State private var activityLevel = 2 // nível de atividade física padrão é Moderadamente ativo
    @State private var imc = "IMC"
    @State private var background = Color("Background")

    private var activityLevels = ["Sedentário", "Levemente ativo", "Moderadamente ativo", "Muito ativo", "Extremamente ativo"]

    //verifica se é válido
    
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
        let weightValue = weight.replacingOccurrences(of: ",", with: ".") // substitui "," por "."
        let heightValue = height.replacingOccurrences(of: ",", with: ".") // substitui "," por "."
        guard let weight = Double(weightValue), let height = Double(heightValue), weight > 0, height > 0 else {
            showAlert()
            return
        }

        guard let age = Int(age), age > 0 else {
            showAlert()
            return
        }

        guard let bodyFatPercentage = Double(bodyFatPercentage), bodyFatPercentage >= 0, bodyFatPercentage <= 100 else {
            showAlert()
            return
        }

        // calcula a massa magra baseado no sexo da pessoa
        let leanWeight: Double
        switch sex {
        case 0: // homem
            let heightInCm = height * 100 // converte altura de metros para centímetros
            leanWeight = (1.10 * weight) - (128 * pow(weight / heightInCm, 2))
        case 1: // mulher
            let heightInCm = height * 100 // converte altura de metros para centímetros
            leanWeight = (1.07 * weight) - (148 * pow(weight / heightInCm, 2))
        default:
            showAlert()
            return
        }

        let adjustedWeight = leanWeight / 0.85 // calcula o peso ajustado, dividindo o peso
        
        //Equação de Harris-Benedict e os diferentes níveis de atividade física. 
        let activityFactor: Double
        
        switch activityLevel {
        case 0: // sedentário
            activityFactor = 1.2
        case 1: // levemente ativo
            activityFactor = 1.375
        case 2: // moderadamente ativo (o valor padrão)
            activityFactor = 1.55
        case 3: // muito ativo
            activityFactor = 1.725
        case 4: // extremamente ativo
            activityFactor = 1.9
        default:
            activityFactor = 1.55 // caso não haja um nível de atividade física válido selecionado, utilizar o valor padrão
        }
        
        let adjustedHeight = height * activityFactor // calcula a altura ajustada, multiplicando a altura pelo fator de                     atividade correspondente ao nível selecionado

        let adjustedImc = adjustedWeight / pow(adjustedHeight, 2) // calcula o IMC ajustado, dividindo o peso ajustado pela                 altura ajustada ao quadrado
        
        //dá uma cor para cada categoria
        
        switch adjustedImc {
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
            
            //exibe a calculadora
            
            VStack {
                Text("Calculadora de IMC")
                    .font(.largeTitle)
                    .bold()
                    .padding(.bottom, 120)
                       
                VStack {
                    Text(imc)
                        .font(.title)
                        .bold()
                    Spacer()
                }
                .padding(.bottom, 100)
                
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
                
                TextField("Idade", text: $age)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
                    .keyboardType(.numberPad)
        
                Picker(selection: $sex, label: Text("Sexo")) {
                 Text("Masculino").tag(0)
                 Text("Feminino").tag(1)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.top, 20)
                .padding(.horizontal, 30)

                Picker(selection: $activityLevel, label: Text("Nível de atividade física")) {
                      ForEach(0..<activityLevels.count) { index in
                          Text(activityLevels[index]).tag(index)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.top, 20)
                .padding(.horizontal, 30)
        
                TextField("Percentual de gordura corporal", text: $bodyFatPercentage)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
                    .keyboardType(.decimalPad)
                    .padding(.top, 20)
                
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
        }
    }


struct ImcProView_Previews: PreviewProvider {
    static var previews: some View {
        ImcProView()
    }
}
