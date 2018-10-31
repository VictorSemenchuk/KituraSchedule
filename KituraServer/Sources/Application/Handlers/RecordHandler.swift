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

struct RecordQuery: QueryParams {
    var userId: Int?
}

class RecordHandler: EntityHandlerProtocol {
    
    func registerRoutes(for router: Router) {
        router.get("/records", handler: loadRecordsHandler)
        router.post("/addrecord", handler: uploadRecord)
        router.post("/updaterecord", handler: updateRecord)
        router.post("/removerecord", handler: removeRecord)
    }
    
    func removeRecord(record: Record, completion: @escaping (Record?, RequestError?) -> Void) {
        guard let connection = Database.default?.getConnection() else {
            completion(nil, RequestError.ormConnectionFailed)
            return
        }
        let recordsTable = KTDatabase.recordsTable
        let query = Delete(from: recordsTable).where(recordsTable.id == record.recordId)
        query.execute(connection) { (queryResult) in
            if let error = queryResult.asError {
                print(error.localizedDescription)
                completion(nil, RequestError.badRequest)
            } else {
                completion(record, nil)
            }
        }
    }
    
    func updateRecord(record: Record, completion: @escaping (Record?, RequestError?) -> Void) {
        guard let connection = Database.default?.getConnection() else {
            completion(nil, RequestError.ormConnectionFailed)
            return
        }
        let recordsTable = KTDatabase.recordsTable
        let query = Update(recordsTable, set: [(recordsTable.startDate, record.startDate), (recordsTable.endDate, record.endDate), (recordsTable.reasonId, record.reasonId)])
                    .where(recordsTable.id == record.recordId)
        query.execute(connection) { (queryResult) in
            if let error = queryResult.asError {
                print(error.localizedDescription)
                completion(nil, RequestError.badRequest)
            } else {
                completion(record, nil)
            }
        }
    }
    
    func uploadRecord(record: Record, completion: @escaping (Record?, RequestError?) -> Void) {
        guard let connection = Database.default?.getConnection() else {
            completion(nil, RequestError.ormConnectionFailed)
            return
        }
        let recordsTable = KTDatabase.recordsTable
        let query = Insert(into: recordsTable,
                           columns: [recordsTable.userId, recordsTable.startDate, recordsTable.endDate, recordsTable.reasonId],
                           values:  [record.userId, record.startDate, record.endDate, record.reasonId])
        query.execute(connection) { (queryResult) in
            if let error = queryResult.asError {
                print(error.localizedDescription)
                completion(nil, RequestError.badRequest)
            } else {
                completion(record, nil)
            }
        }
    }
    
    func loadRecordsHandler(query: RecordQuery, completion: @escaping ([Record]?, RequestError?) -> Void) {
        let rows = fireSelectQuery(with: records(query: query))
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

    private func records(query: RecordQuery) -> Select {
        let recordTable = KTDatabase.recordsTable
        let reasonTable = KTDatabase.reasonsTable
        let colorTable = KTDatabase.colorsTable
        
        var select = Select(from: recordTable)
                    .join(reasonTable)
                    .on(recordTable.reasonId == reasonTable.id)
                    .join(colorTable)
                    .on(reasonTable.colorId == colorTable.id)
        if let userId = query.userId {
            select = select.where(recordTable.userId == userId)
        }
        return select
    }
    
    
}
