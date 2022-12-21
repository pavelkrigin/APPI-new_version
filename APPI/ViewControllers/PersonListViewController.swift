//
//  PersonListViewController.swift
//  APPI
//
//  Created by Pavel Lazarev Macbook on 08.09.2022.
//

import UIKit

final class PersonListViewController: UITableViewController {
    let devFullData = Person.getPersonsData().shuffled() // возвращает массив с экземплярами нашей модели
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        devFullData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "personsData", for: indexPath)
        
        let person = devFullData[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.text = person.fullName
        cell.contentConfiguration = content
        
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "show", sender: nil)
    }

}
