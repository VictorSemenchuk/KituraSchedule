//
//  User.swift
//  Application
//
//  Created by serverVITK on 10/25/18.
//

import Foundation
import SwiftKuery
import SwiftKueryORM

class UsersTable: Table {
    let tableName = "Users"
    
    let id = Column("userid")
    let firstName = Column("firstname")
    let lastName = Column("lastname")
    let email = Column("email")
}

struct User: Model {
    var id: Int
    var firstName: String
    var lastName: String
    var email: String
    
    init?(row: [String: Any?]) {
        guard let idNumber = row["userid"] as? NSNumber,
            let firstName = row["firstname"] as? String,
            let lastName = row["lastname"] as? String,
            let email = row["email"] as? String else {
                return nil
        }
        id = idNumber.intValue
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
    }
}
