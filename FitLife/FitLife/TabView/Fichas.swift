// Primeira página do aplicativo.
// Conterá as fichas de cada usuário.
// Nela será possível criar, acessar, e alterar fichas já personalizadas.

import SwiftUI

struct Fichas: View {
    
    // Vai salvar todas as fichas, cada ficha funciona como um vetor de exercícios
    var ListaFicha = [
        Ficha(
            nome: "Dia A - Superior",
            exercicios: [
                Exercicio(nome: "Supino Inclinado com Halteres", series: 3, carga: 10, anotacao: ant, foto: fotos[0]),
                Exercicio(nome: "Tríceps Máquina", series: 3, carga: 10, anotacao: ant, foto: fotos[1]),
                Exercicio(nome: "Desenvolvimento Máquina", series: 3, carga: 10, anotacao: ant, foto: fotos[2])
            ]
        ),
        Ficha(
            nome: "Dia B - Inferiores",
            exercicios: [
                Exercicio(nome: "Leg Press 45", series: 3, carga: 10, anotacao: ant, foto: fotos[3]),
                Exercicio(nome: "Agachamnento Máquina", series: 3, carga: 10, anotacao: ant, foto: fotos[4]),
                Exercicio(nome: "Gêmeos Sentado", series: 3, carga: 10, anotacao: ant, foto: fotos[5])
            ]
        ),
        Ficha(
            nome: "Ficha Nova",
            exercicios: [
                Exercicio(nome: "Remada Máquina", series: 3, carga: 10, anotacao: ant, foto: fotos[6]),
                Exercicio(nome: "Rosca Scott", series: 3, carga: 10, anotacao: ant, foto: fotos[7]),
                Exercicio(nome: "Crucifixo Inverso Máquina", series: 3, carga: 10, anotacao: ant, foto: fotos[8])
            ]
        )
    ]
    
    var body: some View {
        NavigationView {
            // Vai printar na tela todas as fichas salvas
            List(ListaFicha, id: \.self) {
                ficha in NavigationLink(ficha.nome) {
                    // Chamará outra página passando a ficha em questão como parametro
                    ExibeFicha(exercicios: ficha.exercicios)
                }.font(.title).padding(.top, 25).padding(.bottom, 25)
            }.navigationTitle("Ficha")
            // Image(systemName: "plus.circle")
        }
    }
}

// Carrega uma ficha
struct ExibeFicha: View {
    
    @State var exercicios: [Exercicio]
    var body: some View {
        ScrollView(showsIndicators: false) {
            ForEach(exercicios, id: \.self) { exercicio in
                ExercicioFicha(exercicio: exercicio)
                    .frame(width: 250, height: .infinity)
                    .padding()
            }
        }
        .ignoresSafeArea()
        .frame(width: .infinity)
    }
}

struct ExercicioFicha: View {
    @State var exercicio: Exercicio
    @State private var showingSheet = false
    @State private var isOn = false
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: exercicio.foto!)) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(8.0)
            } placeholder: {
                ProgressView()
            }
            .frame(width: 250, height: 250)
            
            VStack(alignment: .leading) {
                Text(exercicio.nome!)
                    .font(.title)
                    .fontWeight(.bold)
                HStack {
                    Text("\(exercicio.series!)x")
                    Text("-")
                    Text(String(format: "%.1fkg", exercicio.carga!))
                }
                Button("Anotação") {
                    showingSheet.toggle()
                }
                .sheet(isPresented: $showingSheet) {
                    Text(exercicio.anotacao!)
                        .presentationDetents([.medium, .large])
                }
                Toggle("Feito: ", isOn: $isOn)
            }
            
        }.toolbar(.hidden, for: .tabBar)
    }
}

// DESENVOLVIMENTO
struct Fichas_Previews: PreviewProvider {
    static var previews: some View {
        Fichas()
    }
}

var fotos = [
    // Supino Inclinado
    "https://grandeatleta.com.br/wp-content/uploads/2022/07/supino-inclinado-com-halteres.jpg",
    // Tríceps Máquina
    "https://www.mundoboaforma.com.br/wp-content/uploads/2021/07/triceps-sentado-no-aparelho.gif",
    // Desenvolvimento Máquina
    "https://i.pinimg.com/originals/3c/72/55/3c7255660b71703615d7c7e037eab853.png",
    // Leg Press 45
    "https://www.mundoboaforma.com.br/wp-content/uploads/2020/12/pernas-leg-press-45-tradicional-90-graus.gif",
    // Agachamento Máquina
    "https://www.mundoboaforma.com.br/wp-content/uploads/2020/12/agachamento-smith-machine-com-foco-nos-gluteos-e-posteriores-da-coxa.gif",
    // Gemeos Sentando
    "https://ginasiovirtual.com/wp-content/uploads/2021/06/Elevacao-de-gemeos-em-maquina-sentado.jpg",
    // Remada Máquina
    "https://treinomestre.com.br/wp-content/uploads/2021/11/remada-articulada-.jpg",
    // Rosca Scott
    "https://treinomestre.com.br/wp-content/uploads/2016/11/rosca-scott.jpg",
    // Crucifixo Inverso Máquina
    "https://treinomestre.com.br/wp-content/uploads/2018/09/crucifixo-invertido-maquina.jpg.webp"
]

var ant = "Aqui ficam as anotações"
