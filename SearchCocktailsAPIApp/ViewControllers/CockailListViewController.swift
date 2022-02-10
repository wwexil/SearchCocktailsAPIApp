//
//  CockailListViewController.swift
//  SearchCocktailsAPIApp
//
//  Created by Алекс Мерсер on 10.02.2022.
//

import UIKit

class CockailListViewController: UITableViewController {
    
    let networkDataFetcher = NetworkDataFetcher()
    var searchResponse: SearchResponse? = nil
    let searchController = UISearchController(searchResultsController: nil)
    private var timer: Timer?

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 100
        setupSearchBar()
    }
    
    private func setupSearchBar() {
        navigationItem.searchController = searchController
        searchController.searchBar.delegate = self
        navigationController?.navigationBar.prefersLargeTitles = true
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search by ingredient"
    }


    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        searchResponse?.drinks.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CocktailCell
        let cocktail = searchResponse?.drinks[indexPath.row]
        cell.configure(with: cocktail!)
        return cell
    }

}

extension CockailListViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let urlString = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=\(searchText)"

        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { (_) in
            self.networkDataFetcher.fetchTracks(urlString: urlString) { (searchResponse) in
                guard let searchResponse = searchResponse else { return }
                self.searchResponse = searchResponse
                self.tableView.reloadData()
            }

        })
        
    }
}
