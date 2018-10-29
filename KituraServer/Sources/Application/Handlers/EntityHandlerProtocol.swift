//
//  EntityHandlerProtocol.swift
//  Application
//
//  Created by serverVITK on 10/26/18.
//

import Foundation
import Kitura
import SwiftKuery
import SwiftKueryORM
import SwiftKueryPostgreSQL

protocol EntityHandlerProtocol {
    func registerRoutes(for router: Router)
    func queryReasons(with selection: Select) -> [[String: Any?]]?
}

extension EntityHandlerProtocol {
    func queryReasons(with selection: Select) -> [[String: Any?]]? {
        guard let connection = Database.default?.getConnection() else {
            return nil
        }
        var returnRows: [[String: Any?]]?
        connection.execute(query: selection) { (queryResult) in
            if let rows = queryResult.asRows {
                returnRows = rows
            }
        }
        return returnRows
    }
    
}
