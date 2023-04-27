//
//  ViewModel.swift
//  Academia-MVP
//
//  Created by student on 24/04/23.
//

import Foundation


class ViewModel: ObservableObject {
    
    @Published var data = [
        Exercicio(bodyPart: "", equipment: "", gifUrl: "", id: "", name: "Teste", target: "")
    ]
    
    func fetch(target: String) {
        guard let url = URL(string:  "https://exercisedb.p.rapidapi.com/exercises/target/\(target)") else {
            return
        }
        
        let headers = [
            "content-type": "application/octet-stream",
            "X-RapidAPI-Key": "cfec74d954msh02c4c7c7d7ea629p1a7a94jsn3d6d0bae8872",
            "X-RapidAPI-Host": "exercisedb.p.rapidapi.com"
        ]
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let data = try JSONDecoder().decode([Exercicio].self, from: data)
                DispatchQueue.main.async {
                    self?.data = data
                }
            } catch {
                print(error)
            }
        }
        
        task.resume()
    }
    
    

}
