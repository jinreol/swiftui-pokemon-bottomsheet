//
//  PokemonModel.swift
//  pokemon-bottomsheet
//
//  Created by jinreol on 2021/06/20.
//
import Foundation

struct Pokemon: Codable {
    var pokemon: [PokemonItem]
}

struct PokemonItem: Codable, Identifiable {

    let id: String
    let name: String
    let type: [PokemonTypeItem]
    let height: String
    let kind: String
    let weight: String
    let special: String
    let description: String
    let imgUrl: String
    let fullImageUrl: String

    private enum CodingKeys: String, CodingKey {
        case id = "no", name, type, height, kind, weight, special, description, imgUrl, fullImageUrl
    }
}

struct PokemonTypeItem: Codable {
    // let item: PokemonType
    let item: String
}
