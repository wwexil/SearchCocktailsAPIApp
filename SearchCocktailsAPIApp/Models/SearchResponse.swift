//
//  SearchResponse.swift
//  SearchCocktailsAPIApp
//
//  Created by Алекс Мерсер on 10.02.2022.
//

import Foundation

struct SearchResponse: Decodable {
    var drinks: [Cocktail]
}

struct Cocktail: Decodable {
    var strDrink: String?
    var strDrinkThumb: String?
}
