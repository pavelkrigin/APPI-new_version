//
//  ContactDetailsTableViewController.swift
//  APPI
//
//  Created by mac on 9/9/22.
//

import UIKit

final class ContactDetailsTableViewController: UITableViewController {
    
    let personsContact = Person.getPersonsData()
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        personsContact.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        personsContact[section].rows.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let person = personsContact[indexPath.section]
        var content = cell.defaultContentConfiguration()
        content.text = person.rows[indexPath.row]
        
        
        switch indexPath.row {
        case 0:
            content.text = person.email
            content.image = UIImage(systemName: Contacts.email.rawValue)
        case 1:
            content.text = person.telegramm
            content.image = UIImage(systemName: Contacts.telegramm.rawValue)
        default:
            content.text = person.gitAccount
            content.image = UIImage(systemName: Contacts.gitAccount.rawValue)
        }
        
        cell.contentConfiguration = content
        return cell
    }
}

//MARK: - UITableViewDelegate
extension ContactDetailsTableViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: "headerCell") as? HeaderTableViewCell
        let person = personsContact[section]
        cell?.nameLabel.text = person.name
        cell?.surnameLabel.text = person.surname
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        50
    }
}

