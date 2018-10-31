//
//  Cred.swift
//  Application
//
//  Created by serverVITK on 10/25/18.
//

import Foundation
import SwiftKuery
import SwiftKueryORM
import CredentialsHTTP

class CredsTable: Table {
    let tableName = "Creds"
    
    let userId = Column("userid")
    let password = Column("password")
    let email = Column("email")
}

struct Cred: Model, TypeSafeHTTPBasic {
    var id: String
    
    var userId: String
    var email: String
    var password: String
    
    init?(row: [String: Any]) {
        guard let userIdNumber = row["userid"] as? NSNumber,
        let email = row["email"] as? String,
            let password = row["password"] as? String else {
                return nil
        }
        userId = userIdNumber.stringValue
        id = userId
        self.email = email
        self.password = password
    }
    
    static func verifyPassword(username: String, password: String, callback: @escaping (Cred?) -> Void) {
        loadCredForEmail(email: username) { (cred) in
            if let cred = cred {
                if cred.password == password {
                    callback(cred)
                    return
                }
            } else {
                callback(nil)
            }
        }
    }

    static func verifyPassword(username: String, password: String, callback: @escaping (String?, Bool) -> Void) {
        loadCredForEmail(email: username) { (cred) in
            guard let cred = cred else {
                callback(nil, false)
                return
            }
            if password == cred.password {
                callback(cred.userId, true)
                return
            } else {
                callback(nil, false)
                return
            }
        }
    }
    
    static func loadCredForEmail(email: String, completion: @escaping (Cred?) -> Swift.Void) {
        guard let connection = Database.default?.getConnection() else {
            completion(nil)
            return
        }
        let credsTable = KTDatabase.credsTable
        let select = Select(from: credsTable).where(credsTable.email == email)
        connection.execute(query: select) { (queryResult) in
            if let rows = queryResult.asRows, let row = rows.first {
                guard let cred = Cred(row: row) else {
                    completion(nil)
                    return
                }
                completion(cred)
            } else {
                completion(nil)
                return
            }
        }
    }
}
