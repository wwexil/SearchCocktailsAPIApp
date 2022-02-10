//
//  NetworkDataFetcher.swift
//  SearchCocktailsAPIApp
//
//  Created by Алекс Мерсер on 10.02.2022.
//

import Foundation

class NetworkDataFetcher {
    let networkService = NetworkService()
    
    func fetchTracks(urlString: String, response: @escaping (SearchResponse?) -> Void) {
        networkService.request(urlString: urlString) { (result) in
            switch result {
            case .success(let data):
                do {
                    let cocktails = try JSONDecoder().decode(SearchResponse.self, from: data)
                    response(cocktails)
                } catch let jsonError {
                    print("Failed to decode JSON", jsonError)
                    response(nil)
                }
            case .failure(let error):
                print("Error received requesting data: \(error.localizedDescription)")
                response(nil)
            }
        }
    }
}
