//
//  Exercicio.swift
//  Academia-MVP
//
//  Created by student on 24/04/23.
//

import Foundation

struct Exercicio: Decodable, Hashable {
    var bodyPart: String
    var equipment: String
    var gifUrl: String
    var id: String
    var name: String
    var target: String
}
