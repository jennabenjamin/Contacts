//
//  TableViewController.swift
//  TableViewTest
//
//  Created by Jenna Benjamin on 10/17/18.
//  Copyright © 2018 Jenna Benjamin. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    //var names : [String] = ["Salman", "Vineeth", "Shashank"]
    var names : [String:[String]] = [
        "A": ["Andi", "Ayush"], //A is key, Andi is value
        "S": ["Salman", "Shashank", "Sujit"],
        "B": ["Ben", "Benjamin"]
    ]

    var sectionNames: [String]{
        return names.keys.sorted() // ["A',"B","S"]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return sectionNames.count
    }

    override func tableView(_ tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        let currentSection = sectionNames[section]
        guard let currNames = names[currentSection] else { return 0}
        return currNames.count //2
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?{
        return sectionNames[section] //A B or S
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier:
            "nameCell") else { return UITableViewCell()}
      //  cell.textLabel?.text = names[indexPath.row]
        let currentSection = sectionNames[indexPath.section]
        guard let currNames = names[currentSection] else { return UITableViewCell()}
        cell.textLabel?.text = currNames[indexPath.row]
        return cell
    }
}
