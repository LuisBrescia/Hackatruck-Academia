// Nesta página conterá todos os exercícios disponíveis do programa

import SwiftUI

struct Exercicios: View {
    
    @State var searchText = ""
    @StateObject var atividades = ViewModel()
    @State private var section1IsExpanded = false
    @State private var section2IsExpanded = false
    
    var body: some View {
        NavigationView {
            VStack{
                List {
                    Section("Ombro"){
                        ForEach(atividades.chars.filter { $0.treino == "OMBRO" }, id: \._id) { a in
                            NavigationLink(destination: ExibeExercicio(str: a)) {
                                Text(a.nome ?? "")
                            }
                        }
                    }
                    Section("Perna"){
                        ForEach(atividades.chars.filter { $0.treino == "PERNA" }, id: \._id) { a in
                            NavigationLink(destination: ExibeExercicio(str: a)) {
                                Text(a.nome ?? "")
                            }
                        }
                    }
                    Section("Peitoral"){
                        ForEach(atividades.chars.filter { $0.treino == "PEITORAL" }, id: \._id) { a in
                            NavigationLink(destination: ExibeExercicio(str: a)) {
                                Text(a.nome ?? "")
                            }
                        }
                    }
                    Section("Biceps"){
                        ForEach(atividades.chars.filter { $0.treino == "BICEPS" }, id: \._id) { a in
                            NavigationLink(destination: ExibeExercicio(str: a)) {
                                Text(a.nome ?? "")
                            }
                        }
                    }
                    Section("Dorsal"){
                        ForEach(atividades.chars.filter { $0.treino == "DORSAL" }, id: \._id) { a in
                            NavigationLink(destination: ExibeExercicio(str: a)) {
                                Text(a.nome ?? "")
                            }
                        }
                    }
                    Section("Gluteos"){
                        ForEach(atividades.chars.filter { $0.treino == "GLUTEOS" }, id: \._id) { a in
                            NavigationLink(destination: ExibeExercicio(str: a)) {
                                Text(a.nome ?? "")
                            }
                        }
                    }
                    Section("Abdomen"){
                        ForEach(atividades.chars.filter { $0.treino == "ABDOMEN" }, id: \._id) { a in
                            NavigationLink(destination: ExibeExercicio(str: a)) {
                                Text(a.nome ?? "")
                            }
                        }
                    }
                    Section("Triceps"){
                        ForEach(atividades.chars.filter { $0.treino == "TRICEPS" }, id: \._id) { a in
                            NavigationLink(destination: ExibeExercicio(str: a)) {
                                Text(a.nome ?? "")
                            }
                        }
                    }
                }
                .navigationTitle("Exercícios")
                .searchable(text: $searchText)
            }.onAppear { atividades.fetch() }
        } // Fim da Navigation View
    }
}

struct Exercicios_Previews: PreviewProvider {
    static var previews: some View {
        Exercicios()
    }
}

// AO CLICAR EM EXERCÍCIO
struct ExibeExercicio: View {
    
    // Para o botão de adicionar
    @State private var showOptions = false
    @State private var isToggle1On = false
    @State private var isToggle2On = false
    @State private var isToggle3On = false
    
    // Exercício em questão
    @State var str: Exercicio
    
    var body: some View {
        VStack{
            
            Text(str.treino!).font(.largeTitle)
            AsyncImage(url: URL(string: str.img!)) { image in
                image
                    .resizable().frame(width: 350, height: 350)
            } placeholder: {
                ProgressView()
                    .font(.largeTitle).frame(width: 350, height: 350)
            } // Fim do placeholder
            
            Text(str.nome!).font(.title).padding()
            Button { showOptions = true }
        label: {
            VStack {
                Image(systemName: "plus.circle")
                    .resizable()
                    .frame(width: 70, height: 70)
                    .foregroundColor(.red)
                Text("Adicionar em ficha").foregroundColor(.red)
            } // VStack Button
        } // Label Button
        }.sheet(isPresented: $showOptions) {
            VStack {
                Toggle(isOn: $isToggle1On) {Text("Ficha 1")}
                Toggle(isOn: $isToggle2On) {Text("Ficha 2")}
                Toggle(isOn: $isToggle3On) {Text("Ficha 3")}
                Button(action: {showOptions = false}) {Text("OK")}
            }.padding() // VStack button
        }.toolbar(.hidden, for: .tabBar) // VStack página
    }
}


