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
    tableView.dataSource = self
    tableView.delegate = self
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    countries.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    <#code#>
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    <#code#>
  }
  
  func loadJson() {
    if let url = Bundle.main.url(forResource: "countries", withExtension: "json") {
      
      do {
        let data = try Data(contentsOf: url)
        parse(jsonData: data)
      } catch {
        print("Error loading JSON data, \(error.localizedDescription)")
      }
    } else {
      print("Could not find JSON file")
    }
  }
  
  func parse(jsonData: Data) {
    let decoder = JSONDecoder()
    
    do {
      let decodedData = try decoder.decode([Country].self, from: jsonData)
      countries = decodedData
      
      DispatchQueue.main.async {
        self.tableView.reloadData()
      }
    } catch {
      print("Error parsing JSON data, \(error.localizedDescription)")
    }
  }
}
