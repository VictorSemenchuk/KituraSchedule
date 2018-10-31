//
//  UserHandler.swift
//  Application
//
//  Created by serverVITK on 10/29/18.
//

import Foundation
import Kitura
import SwiftKuery
import SwiftKueryORM
import SwiftKueryPostgreSQL
import LoggerAPI

class UserHandler: EntityHandlerProtocol {
    
    func registerRoutes(for router: Router) {
        router.get("/users", handler: loadUsersHandler)
    }
    
    func loadUsersHandler(completion: @escaping ([User]?, RequestError?) -> Void) {
        let rows = fireSelectQuery(with: allUsers())
        if let rows = rows {
            var users = [User]()
            for row in rows {
                guard let user = User(row: row) else {
                    continue
                }
                users.append(user)
            }
            completion(users, nil)
        } else {
            completion(nil, RequestError.noContent)
        }
    }
    
    private func allUsers() -> Select {
        let recordTable = KTDatabase.usersTable
        Log.info("Fetching all users")
        return Select(from: recordTable)
    }
    
}
