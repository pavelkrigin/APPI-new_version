//
//  Person.swift
//  APPI
//
//  Created by Pavel Krigin on 6.9.22..
//

import Foundation

struct User {
    let login: String
    let password: String
    
    static func getUserData() -> User {
        User(
            login: "User",
            password: "1"

        )
    }
}

struct Person {
    
    let name: String
    let surname: String
    let email: String
    let telegramm: String
    let gitAccount: String
    
    var fullName: String {
        "\(name) \(surname)"
    }
    var rows: [String] {
            [email, telegramm, gitAccount]
        }
}
extension Person {
    static func getPersonsData() -> [Person] {
        var persons:[Person] = []
        let dataStore = DataStore.shared
        
        for person in 0..<dataStore.names.count {
            persons.append(Person(name: dataStore.names[person],
                                  surname: dataStore.surnames[person],
                                  email: dataStore.emails[person],
                                  telegramm: dataStore.telegramms[person],
                                  gitAccount: dataStore.gitAccounts[person]
                                 )
            )
        }
        
        return persons
    }
}

enum Contacts: String {
    case email = "envelope.circle.fill"
    case telegramm = "bubble.left.fill"
    case gitAccount = "pawprint.circle.fill"
}
