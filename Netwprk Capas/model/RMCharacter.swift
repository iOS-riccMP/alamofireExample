//
//  RMCharacter.swift
//  NetworkCapas
//
//  Created by Riccardo Mija Padilla on 28/04/21.
//

import Foundation

// MARK: - Welcome
struct RMCharacter : Codable {
    let id: Int
    let name, status, species, type: String
    let gender: String
    let image: String
    let episode: [String]
    let url: String
    let created: String
}
