//
//  Auth.swift
//  LoginScreen
//
//  Created by StudentBackup01 on 25/04/23.
//

import SwiftUI

struct LoginView: View {
    
    @State private var isPresented = false
    @State private var isPasswordShown = false
    @State private var username = ""
    @State private var password = ""
    @State private var wrongUsername: CGFloat = 0
    @State private var wrongPassword: CGFloat = 0
    @State private var showingLoginScreen = false
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.blue, .white, .white, .white, .white, .white, .white, .blue]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                VStack {
                    Image("FIT LIFE")
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(30)
                        .aspectRatio(contentMode: .fit)
                        .padding(.horizontal, 50)
                        .padding(.bottom, 30)
                        .padding(.top, -80)
                    
                    Text("Login")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    
                    TextField("Usuário", text: $username)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(Color.red, width: wrongUsername)
                    
                    HStack {
                            if isPasswordShown {
                                TextField("Senha", text: $password)
                            } else {
                                    SecureField("Senha", text: $password)
                                }
                                Button(action: {
                                    isPasswordShown.toggle()
                                }) {
                                Image(systemName: isPasswordShown ? "eye.fill" : "eye.slash.fill")
                                                    .foregroundColor(.gray)
                                }
                                .padding(.trailing, 8)
                                }
                            .padding()
                            .frame(width: 300, height: 50)
                            .background(Color.black.opacity(0.05))
                            .cornerRadius(10)
                            .border(.red, width: CGFloat(wrongPassword))
                    
                    Button("Login") {
                        authenticateUser(username: username, password: password)
                    }
                    .foregroundColor(.white)
                    .frame(width: 300, height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .padding(.top, 15)
                    
                    NavigationLink(destination: Text("You are logged in @\(username)"), isActive: $showingLoginScreen) {
                        EmptyView() 
                    }
                    
                    Button("Criar usuário") {
                        // Aqui você pode adicionar qualquer lógica necessária para criar um novo usuário
                        
                        // Navegue para a view CreateUserView
                        self.isPresented = true
                    }
                    .foregroundColor(.blue)
                    .cornerRadius(10)
                    .padding(.top, 15)
                    .sheet(isPresented: $isPresented) {
                        // Apresente a view CreateUserView em um modal
                        CreateUserView()
                    }
                }
            }.navigationBarHidden(true)
        }
    }
    
    func authenticateUser(username: String, password: String) {
        if let user = UserManager.getUser() {
            if user.username.lowercased() == username.lowercased() {
                if user.password == password {
                    // autenticação bem sucedida
                    showingLoginScreen = true
                } else {
                    // senha incorreta
                    wrongPassword = 2
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        wrongPassword = 0
                        let generator = UINotificationFeedbackGenerator()
                        generator.notificationOccurred(.error)
                        let errorMessage = "A senha está incorreta"
                        let ac = UIAlertController(title: "Erro", message: errorMessage, preferredStyle: .alert)
                        ac.addAction(UIAlertAction(title: "OK", style: .default))
                        UIApplication.shared.windows.first?.rootViewController?.present(ac, animated: true)
                    }
                }
            } else {
                // nome de usuário incorreto
                wrongUsername = 2
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    wrongUsername = 0
                    let generator = UINotificationFeedbackGenerator()
                    generator.notificationOccurred(.error)
                    let errorMessage = "O usuário não existe"
                    let ac = UIAlertController(title: "Erro", message: errorMessage, preferredStyle: .alert)
                    ac.addAction(UIAlertAction(title: "OK", style: .default))
                    UIApplication.shared.windows.first?.rootViewController?.present(ac, animated: true)
                }
            }
        } else {
            // nenhum usuário cadastrado
            wrongUsername = 2
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                wrongUsername = 0
                let generator = UINotificationFeedbackGenerator()
                generator.notificationOccurred(.error)
                let errorMessage = "Nenhum usuário cadastrado"
                let ac = UIAlertController(title: "Erro", message: errorMessage, preferredStyle: .alert)
                ac.addAction(UIAlertAction(title: "OK", style: .default))
                UIApplication.shared.windows.first?.rootViewController?.present(ac, animated: true)
            }
        }
    }
}
