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
    let cell = tableView.dequeueReusableCell(withIdentifier: "Detail Cell", for: indexPath)
    //custom configure method
    return cell
  }
  
  private func configureCell(_ cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    guard let country = country else {
      cell.textLabel?.text = "N/A"
      return
    }
  }
  
  //MARK: - Table view delegate methods
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
  }
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    50
  }
  
}
