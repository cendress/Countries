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
  
}
