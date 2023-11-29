//
//  DetailTableVC.swift
//  Countries
//
//  Created by Christopher Endress on 11/29/23.
//

import UIKit

class DetailTableVC: UITableViewController {
  var country: Country?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.title = country?.name ?? "Country Details"
  }
  
  //MARK: - Table view data source methods
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 5
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "DetailCell", for: indexPath)
    configureCell(cell, forRowAt: indexPath)
    return cell
  }
  
  private func configureCell(_ cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    guard let country = country else {
      cell.textLabel?.text = "N/A"
      return
    }
    
    switch indexPath.row {
    case 0:
      cell.textLabel?.text = "Name: \(country.name)"
    case 1:
      cell.textLabel?.text = "Capital: \(country.capital)"
    case 2:
      cell.textLabel?.text = "Size: \(country.size)"
    case 3:
      cell.textLabel?.text = "Population: \(country.population)"
    case 4:
      cell.textLabel?.text = "Currency: \(country.currency)"
    default:
      cell.textLabel?.text = "N/A"
    }
    
    cell.textLabel?.numberOfLines = 0
  }
  
  //MARK: - Table view delegate methods
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
  }
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    50
  }
  
}
