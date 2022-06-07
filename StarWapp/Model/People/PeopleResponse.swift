//
//  PeopleRequest.swift
//  StarWapp
//
//  Created by Wallace Baldenebre on 06/06/22.
//

import Foundation

struct PeopleResponse: Decodable {
    let name: String?
    let height: String?
    let mass: String?
    let hairColor: String?
    let skinColor: String?
    let eyeColor: String?
    let birthYear: String?
    let gender: String?
    let homeworld: String?
    let films: Array<String>?
    let species: Array<String>?
    let vehicles: Array<String>?
    let starships: Array<String>?
    let created: String?
    let edited: String?
    let url: String?
   
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        height = try container.decode(String.self, forKey: .height)
        mass = try container.decode(String.self, forKey: .mass)
        hairColor = try container.decode(String.self, forKey: .hairColor)
        skinColor = try container.decode(String.self, forKey: .skinColor)
        eyeColor = try container.decode(String.self, forKey: .eyeColor)
        birthYear = try container.decode(String.self, forKey: .birthYear)
        gender = try container.decode(String.self, forKey: .gender)
        homeworld = try container.decode(String.self, forKey: .homeworld)
        films = try container.decode(Array.self, forKey: .films)
        species = try container.decode(Array.self, forKey: .species)
        vehicles = try container.decode(Array.self, forKey: .vehicles)
        starships = try container.decode(Array.self, forKey: .starships)
        created = try container.decode(String.self, forKey: .created)
        edited = try container.decode(String.self, forKey: .edited)
        url = try container.decode(String.self, forKey: .url)
    }
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case height = "height"
        case mass = "mass"
        case hairColor = "hair_color"
        case skinColor = "skin_color"
        case eyeColor = "eye_color"
        case birthYear = "birth_year"
        case gender = "gender"
        case homeworld = "homeworld"
        case films = "films"
        case species = "species"
        case vehicles = "vehicles"
        case starships = "starships"
        case created = "created"
        case edited = "edited"
        case url = "url"
    }
}
