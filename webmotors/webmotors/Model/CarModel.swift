//
//  CarModel.swift
//  webmotors
//
//  Created by Nadilson Santana on 7/24/22.
//

import Foundation

// MARK: - WelcomeElement
struct CarModel: Codable {
    let id: Int
    let make, model, version: String
    let image: String
    let km: Int
    let price: String
    let yearModel, yearFab: Int
    let color: String

    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case make = "Make"
        case model = "Model"
        case version = "Version"
        case image = "Image"
        case km = "KM"
        case price = "Price"
        case yearModel = "YearModel"
        case yearFab = "YearFab"
        case color = "Color"
    }
}


