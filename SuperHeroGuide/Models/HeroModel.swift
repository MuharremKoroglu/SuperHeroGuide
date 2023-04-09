//
//  HeroModel.swift
//  SuperHeroGuide
//
//  Created by Muharrem Köroğlu on 2.04.2023.
//

import Foundation


// MARK: - Welcome
struct HeroModel: Codable {
    let name: String
    let powerstats: Powerstats
    let biography: Biography
    let appearance: Appearance
    let image: Image
}

// MARK: - Appearance
struct Appearance: Codable {
    let gender: String
    let height, weight: [String]
}

// MARK: - Biography
struct Biography: Codable {
    let fullName: String
    let placeOfBirth: String

    enum CodingKeys: String, CodingKey {
        case fullName = "full-name"
        case placeOfBirth = "place-of-birth"
    }
}

// MARK: - Image
struct Image: Codable {
    let url: String
}

// MARK: - Powerstats
struct Powerstats: Codable {
    let intelligence, strength, speed, durability: String
    let power, combat: String
}

