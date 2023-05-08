// Neste arquivo contém todo o conteúdo para rodar
// a primeira página do TabView

import SwiftUI

struct Fichas: View {
    
    var resposta = [
        Ficha(
            nome: "Dia A - Peito, Triceps e Ombros",
            exercicios: [
                Exercicio(nome: "Supino Inclinado com Halteres", series: 3, carga: 10, anotacao: "Aqui ficam as Anotações", foto: "https://grandeatleta.com.br/wp-content/uploads/2022/07/supino-inclinado-com-halteres.jpg"),
                Exercicio(nome: "Tríceps Máquina", series: 3, carga: 10, anotacao: "Aqui ficam as Anotações", foto: "https://www.mundoboaforma.com.br/wp-content/uploads/2021/07/triceps-sentado-no-aparelho.gif"),
                Exercicio(nome: "Desenvolvimento Máquina", series: 3, carga: 10, anotacao: "Aqui ficam as Anotações", foto: "https://i.pinimg.com/originals/3c/72/55/3c7255660b71703615d7c7e037eab853.png")
            ]
        ),
        Ficha(
            nome: "Dia B - Pernas",
            exercicios: [
                Exercicio(nome: "Leg Press 45", series: 3, carga: 10, anotacao: "Aqui ficam as Anotações", foto: "https://www.mundoboaforma.com.br/wp-content/uploads/2020/12/pernas-leg-press-45-tradicional-90-graus.gif"),
                Exercicio(nome: "Agachamnento Máquina", series: 3, carga: 10, anotacao: "Aqui ficam as Anotações", foto: "https://www.mundoboaforma.com.br/wp-content/uploads/2020/12/agachamento-smith-machine-com-foco-nos-gluteos-e-posteriores-da-coxa.gif"),
                Exercicio(nome: "Gêmeos Sentado", series: 3, carga: 10, anotacao: "Aqui ficam as Anotações", foto: "https://ginasiovirtual.com/wp-content/uploads/2021/06/Elevacao-de-gemeos-em-maquina-sentado.jpg")
            ]
        ),
        Ficha(
            nome: "Dia C - Costas e Bíceps",
            exercicios: [
                Exercicio(nome: "Remada Máquina", series: 3, carga: 10, anotacao: "Aqui ficam as Anotações", foto: "https://treinomestre.com.br/wp-content/uploads/2021/11/remada-articulada-.jpg"),
                Exercicio(nome: "Rosca Scott", series: 3, carga: 10, anotacao: "Aqui ficam as Anotações", foto: "https://treinomestre.com.br/wp-content/uploads/2016/11/rosca-scott.jpg"),
                Exercicio(nome: "Crucifixo Inverso Máquina", series: 3, carga: 10, anotacao: "Aqui ficam as Anotações", foto: "https://treinomestre.com.br/wp-content/uploads/2018/09/crucifixo-invertido-maquina.jpg.webp")
            ]
        )
    ]
    
    var body: some View {
        NavigationView {
            List(resposta, id: \.self) { ficha in
                NavigationLink(ficha.nome) {
                    ListaExercios(exercicios: ficha.exercicios)
                }
            }.navigationTitle("Ficha")}
    }
}

struct Fichas_Previews: PreviewProvider {
    static var previews: some View {
        Fichas()
    }
}

struct ListaExercios: View {
    @State var exercicios: [Exercicio]
    
    var body: some View {
        ScrollView {
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

struct ListaExercios_Previews: PreviewProvider {
    static var previews: some View {
        let exercicios = [
            Exercicio(
                nome: "Rosca reta",
                series: 3,
                carga: 15,
                anotacao: "Anotação",
                foto: "https://grandeatleta.com.br/wp-content/uploads/2018/07/rosca-direta-barra-reta-ou-w.jpg"
            ),
            Exercicio(
                nome: "Rosca reta direta",
                series: 3,
                carga: 15,
                anotacao: "Anotação",
                foto: "https://grandeatleta.com.br/wp-content/uploads/2018/07/rosca-direta-barra-reta-ou-w.jpg"
            )
        ]
        ListaExercios(exercicios: exercicios)

    }
}

struct ExercicioFicha: View {
    @State var exercicio: Exercicio
    @State private var showingSheet = false
    @State private var isOn = false
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: exercicio.foto)) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(8.0)
            } placeholder: {
                ProgressView()
            }
            .frame(width: 250, height: 250)
            
            VStack(alignment: .leading) {
                Text(exercicio.nome)
                    .font(.title)
                    .fontWeight(.bold)
                
                HStack {
                    Text("\(exercicio.series)x")
                    Text("-")
                    Text(String(format: "%.1fkg", exercicio.carga))
                }
                
                Button("Anotação") {
                    showingSheet.toggle()
                }
                .sheet(isPresented: $showingSheet) {
                    Text(exercicio.anotacao)
                        .presentationDetents([.medium, .large])
                }
                
                Toggle("Feito: ", isOn: $isOn)
            }
            
        }
    }
}

struct ExercicioFicha_Previews: PreviewProvider {
    static var previews: some View {
        let exercicio = Exercicio(
            nome: "Rosca reta direta",
            series: 3,
            carga: 15,
            anotacao: "Anotação",
            foto: "https://grandeatleta.com.br/wp-content/uploads/2018/07/rosca-direta-barra-reta-ou-w.jpg"
        )
        ExercicioFicha(exercicio: exercicio)
    }
}

