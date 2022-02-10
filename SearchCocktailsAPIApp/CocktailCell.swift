//
//  CocktailCell.swift
//  SearchCocktailsAPIApp
//
//  Created by Алекс Мерсер on 10.02.2022.
//

import UIKit

class CocktailCell: UITableViewCell {
    
    @IBOutlet weak var cocktailImage: UIImageView!
    @IBOutlet weak var cocktailNameLabel: UILabel!
    
    
    func configure(with cocktail: Cocktail) {
        cocktailNameLabel.text = cocktail.strDrink
        NetworkDataFetcher.shared.fetchImage(from: cocktail.strDrinkThumb) { result in
            switch result {
            case .success(let imageData):
                self.cocktailImage.image = UIImage(data: imageData)
            case .failure(let error):
                print(error)
            }
        }
    }

}
