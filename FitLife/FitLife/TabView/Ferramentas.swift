// Aba onde conterá as ferramentas da página e login

import SwiftUI


struct Ferramentas: View {
    
    var body: some View {
        List {
            Section {
                NavigationLink {
                    TelaLogin()
                } label: {
                    HStack {
                        Image("banner-rosca")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 80, height: 80)
                            .clipShape(Circle())
                            .padding(.trailing)
                        
                        VStack(alignment: .leading) {
                            // Caso usuário seja "", Text vai ser:
                            // Text("Logar em uma conta")
                            // Text("\(username)")
                            Text(global.username)
                                .font(.title2)
                                .fontWeight(.medium)
                            HStack { Text("2,00m - 134kg") }
                        }
                    }
                }
            }
            
            // AJUDA
            Section(header: Text("Serviços")) {
                NavigationLink("Calculadora IMC") {CalculadoraIMC()}.font(.title).padding(5)
                NavigationLink("Calculadora IMC Pro") {ProCalculadoraIMC()}.font(.title).padding(5)
                NavigationLink("Timer Água") {AguaDiaria()}.font(.title).padding(5)
                NavigationLink("Timer Tempo") {TimerView()}.font(.title).padding(5)
            }
        }.navigationTitle("Ferramentas")
    }
}

struct leo: PreviewProvider {
    static var previews: some View {
        Ferramentas()
    }
}
