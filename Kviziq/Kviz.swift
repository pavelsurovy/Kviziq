//
//  Kviz.swift
//  Kviziq
//
//  Created by Palino on 04/10/2022.
//

struct Kviz: Decodable {
    let otazka: String
    let obrazok: String
    let odpovede: [String]
}
