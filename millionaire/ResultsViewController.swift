//
//  ResultsViewController.swift
//  millionaire
//
//  Created by Mergen Sanzhiyev on 15.06.2021.
//

import UIKit

class ResultsViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return Game.shared.results.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> TableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "results", for: indexPath) as! TableViewCell
        
        let result = Game.shared.results[indexPath.row]
        cell.result.text = "\(result.date) \(result.score)"
        return cell
    }
}
