//
//  HomeScreenController.swift
//  WeatherAppCC
//
//  Created by Ragha Sindhura Kurella Venkata Subba on 9/7/23.
//

import UIKit

class HomeScreenController: UIViewController {

    @IBAction func searchLocation(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let weatherSearchController = storyboard.instantiateViewController(withIdentifier: "WeatherSearchController")
        self.navigationController?.pushViewController(weatherSearchController, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
    }


}

