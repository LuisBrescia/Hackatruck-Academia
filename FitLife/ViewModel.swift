// Arquivo que chama a API
// E declara nossos objetos

import SwiftUI
import Foundation

struct Exercicio: Hashable, Codable {
    var _id: String?
    var _rev: String?
    var treino: String?
    var nome: String?
}

struct Ficha: Hashable, Codable {
    var nome: String
    var exercicios: [Exercicio]
}

class ViewModel: ObservableObject {
    
    @Published var chars : Exercicio = Exercicio()
    
    func fetch(){
        // URL da API
        guard let url = URL(string: "http://127.0.0.1:1880/getfitlife") else {return}
        
        let task = URLSession.shared.dataTask(with: url){ [weak self]
            data, _, error in
            guard let data = data, error == nil else {return}
            do {
                let parsed = try JSONDecoder().decode(Exercicio.self, from: data)
                DispatchQueue.main.sync {
                    self?.chars = parsed
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
}
