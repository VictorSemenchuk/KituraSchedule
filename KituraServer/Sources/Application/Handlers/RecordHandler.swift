//
//  RecordHandler.swift
//  Application
//
//  Created by serverVITK on 10/26/18.
//

import Foundation
import Kitura
import SwiftKuery
import SwiftKueryORM
import SwiftKueryPostgreSQL

class RecordHandler: EntityHandlerProtocol {
    
    func registerRoutes(for router: Router) {
        router.get("/records", handler: loadRecordsHandler)
    }
    
    func loadRecordsHandler(completion: @escaping ([Record]?, RequestError?) -> Void) {
        let rows = queryReasons(with: allRecords())
        if let rows = rows {
            var records = [Record]()
            for row in rows {
                guard let record = Record(row: row) else {
                    continue
                }
                records.append(record)
            }
            completion(records, nil)
        } else {
             completion(nil, RequestError.noContent)
        }
    }
    
    private func allRecords() -> Select {
        let recordTable = KTDatabase.recordsTable
        let reasonTable = KTDatabase.reasonsTable
        let colorTable = KTDatabase.colorsTable
        
        return Select(from: recordTable)
            .join(reasonTable).on(recordTable.reasonId == reasonTable.id)
            .join(colorTable).on(reasonTable.colorId == colorTable.id)
    }
    
}
