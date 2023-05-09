//
//  PaginaFicha.swift
//  projeto-final
//
//  Created by student on 28/04/23.
//

import SwiftUI

struct PaginaFicha: View {
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
            }
            .navigationTitle("Fichas")
        }
    }
}

struct PaginaFicha_Previews: PreviewProvider {
    static var previews: some View {
        PaginaFicha()
    }
}

