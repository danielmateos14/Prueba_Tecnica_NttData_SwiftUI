//
//  Model.swift
//  Prueba
//
//  Created by Daniel Mateos on 05/07/23.
//

import Foundation

// MARK: - Welcome
struct Welcome: Codable {
    let products: [Product]
    let total, skip, limit: Int

}

// MARK: - Product
struct Product:Codable, Identifiable{
    var id: Int
    let title, description: String
    let price: Int
    let discountPercentage, rating: Double
    let stock: Int
    let brand, category: String
    let thumbnail: String
    let images: [String]
    

}
