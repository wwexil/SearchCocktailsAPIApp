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
        DispatchQueue.global().async {
            guard let url = URL(string: cocktail.strDrinkThumb ?? "") else { return }
            guard let imageData = try? Data(contentsOf: url) else { return }
            DispatchQueue.main.async {
                self.cocktailImage.image = UIImage(data: imageData)
            }
        }
    }

}
