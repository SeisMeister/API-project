//
//  RepTableViewController.swift
//  API Project
//
//  Created by Cesar Fernandez on 5/9/24.
//

import UIKit


class RepTableViewController: UITableViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var info = [RepInfo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Load rep info
        // Assign info to RepCell?
        
    }
    
    // Call cellForRowAt to load rep data into cell
    
    func fetchMatchingItems() {
        
        self.info = []
        self.tableView.reloadData()
        
        let searchTerm = searchBar.text ?? ""
        
        if !searchTerm.isEmpty {
            
            // use the item controller to fetch items
            Task {
                do {
                    // Left off on here at 4:30 on Thursday May 9th
                    self.info = await RepInfoAPI.fetchRepInfo(zip: searchTerm)
                    self.tableView.reloadData()
                }
            }
            // if successful, use the main queue to set self.items and reload the table view
            // otherwise, print an error to the console
        }
    }
    
    
    func configure(cell: UITableViewCell, forItemAt indexPath: IndexPath) {
        guard let cell = cell as? RepCell else { return }
        let info = info[indexPath.row]
        
        configure(cell: cell, for: info)
    }
    
    func configure(cell: RepCell, for info: RepInfo) {
        // set cell.name to the repInfo's name
        cell.repNameLabel.text = info.name
        
        // set cell's party and state label to the repInfo's labels
        cell.partyAndStateLabel.text = info.party
        
        // set cell.artworkImage to nil
        cell.linkLabel.text = info.link.absoluteString
        
        // initialize a network task to fetch the item's artwork keeping track of the task
        // in imageLoadTasks so they can be cancelled if the cell will not be shown after
        // the task completes.
        //
        // if successful, set the cell.artworkImage using the returned image
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RepCell", for: indexPath) as! RepCell
        
        let rep = info[indexPath.row]
        
        // For all values below currently 5/9 @6:17pm Thread 1: Fatal error: Unexpectedly found nil while implicitly unwrapping an Optional value
        cell.repNameLabel.text = rep.name
        cell.partyAndStateLabel.text = "\(rep.party), \(rep.state)"
        cell.linkLabel.text = rep.link.absoluteString
        
        return cell
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // Is this method even necessary? If it is I need to return a rep value.
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // call fetchRepInfo in here?
        // or would I construct the method in here to return the dequed cell?
        return info.count
    }
}

extension RepTableViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        fetchMatchingItems()
        searchBar.resignFirstResponder()
    }
}
