//
//  StarshipResponse.swift
//  StarWapp
//
//  Created by Wallace Baldenebre on 06/06/22.
//

import Foundation

struct StartshipResponse: Decodable {
    let name: String?
    let model: String?
    let manufacturer: String?
    let costInCredits: String?
    let length: String?
    let maxAtmospheringSpeed: String?
    let crew: String?
    let passengers: String?
    let cargoCapacity: String?
    let consumables: String?
    let hyperdriveRating: String?
    let mglt: String?
    let starshipClass: String?
    let pilots: Array<String>?
    let created: String?
    let edited: String?
    let url: String?
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        model = try container.decode(String.self, forKey: .model)
        manufacturer = try container.decode(String.self, forKey: .manufacturer)
        costInCredits = try container.decode(String.self, forKey: .costInCredits)
        length = try container.decode(String.self, forKey: .length)
        maxAtmospheringSpeed = try container.decode(String.self, forKey: .maxAtmospheringSpeed)
        crew = try container.decode(String.self, forKey: .crew)
        passengers = try container.decode(String.self, forKey: .passengers)
        cargoCapacity = try container.decode(String.self, forKey: .cargoCapacity)
        consumables = try container.decode(String.self, forKey: .consumables)
        hyperdriveRating = try container.decode(String.self, forKey: .hyperdriveRating)
        mglt = try container.decode(String.self, forKey: .mglt)
        starshipClass = try container.decode(String.self, forKey: .starshipClass)
        pilots = try container.decode(Array.self, forKey: .pilots)
        created = try container.decode(String.self, forKey: .created)
        edited = try container.decode(String.self, forKey: .edited)
        url = try container.decode(String.self, forKey: .url)
    }
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case model = "model"
        case manufacturer = "manufacturer"
        case costInCredits = "cost_in_credits"
        case length = "length"
        case maxAtmospheringSpeed = "max_atmosphering_speed"
        case crew = "crew"
        case passengers = "passengers"
        case cargoCapacity = "cargo_capacity"
        case consumables = "consumables"
        case hyperdriveRating = "hyperdrive_rating"
        case mglt = "MGLT"
        case starshipClass = "starship_class"
        case pilots = "pilots"
        case created = "created"
        case edited = "edited"
        case url = "url"
    }
}

