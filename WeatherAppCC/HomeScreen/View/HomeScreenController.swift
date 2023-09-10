//
//  HomeScreenController.swift
//  WeatherAppCC
//
//  Created by Ragha Sindhura Kurella Venkata Subba on 9/7/23.
//

import UIKit

class HomeScreenController: UIViewController {
    
    // View model for home screen
    private let recentSearchViewModel = RecentSearchViewModel()

    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func searchLocation(_ sender: Any) {
        // Launch Weather Search Controller
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let weatherSearchController = storyboard.instantiateViewController(withIdentifier: "WeatherSearchController")
        self.navigationController?.pushViewController(weatherSearchController, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Refresh home screen with recent search
        recentSearchViewModel.getHistory()
        tableView.reloadData()
    }
}

extension HomeScreenController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        cell.textLabel?.text = recentSearchViewModel.cityName(at: indexPath.row)
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recentSearchViewModel.rows
    }
}
