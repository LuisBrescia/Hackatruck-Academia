//
//  createUserView.swift
//  LoginScreen
//
//  Created by StudentBackup01 on 24/04/23.
//

import Foundation

import SwiftUI

struct CreateUserView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var showPassword = false
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.white, .white, .gray]), startPoint: .top, endPoint: .bottom).ignoresSafeArea()
            
            VStack {
                Text("Criar Usuário")
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding(.top, 50)
                
                Image("FIT LIFE")
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(30)
                    .aspectRatio(contentMode: .fit)
                    .padding(.horizontal, 50)
                    .padding(.bottom, 10)
                    .padding(.top, -80)
                
                TextField("Nome de usuário", text: $username)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
                
                HStack {
                    if showPassword {
                        TextField("Senha", text: $password)
                            .padding()
                    } else {
                        SecureField("Senha", text: $password)
                            .padding()
                    }
                    Button(action: {
                        showPassword.toggle()
                    }) {
                        Image(systemName: showPassword ? "eye.fill" : "eye.slash.fill")
                            .foregroundColor(Color.secondary)
                    }
                }
                .frame(width: 300, height: 50)
                .background(Color.black.opacity(0.05))
                .cornerRadius(10)
                
                Button("Cadastrar") {
                    UserManager.saveUser(username: username, password: password)
                    presentationMode.wrappedValue.dismiss()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        let alert = UIAlertController(title: "Usuário Cadastrado com Sucesso", message: nil, preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK", style: .default))
                        UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true, completion: nil)
                    }
                }
                .foregroundColor(.white)
                .frame(width: 300, height: 50)
                .background(Color.blue)
                .cornerRadius(10)
                .padding(.top, 15)
                
                Spacer()
            }
        }
    }
}
