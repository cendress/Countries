//
//  CountryTableVC.swift
//  Countries
//
//  Created by Christopher Endress on 11/29/23.
//

import UIKit

class CountriesTableVC: UITableViewController {
  
  var countries: [Country] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  
  func loadJson() {
    if let url = Bundle.main.url(forResource: "countries", withExtension: "json") {
      if let data = try? Data(contentsOf: url) {
        parse(jsonData: data)
      }
    }
  }
  
  func parse(jsonData: Data) {
    let decoder = JSONDecoder()
    
    if let decodedData = try? decoder.decode([Country].self, from: jsonData) {
      countries = decodedData
      tableView.reloadData()
    }
  }
}
