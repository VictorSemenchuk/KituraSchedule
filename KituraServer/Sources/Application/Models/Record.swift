//
//  Record.swift
//  Application
//
//  Created by serverVITK on 10/25/18.
//

import Foundation
import SwiftKuery
import SwiftKueryORM

class RecordsTable: Table {
    let tableName = "Records"

    let id = Column("recordid", autoIncrement: true, primaryKey: true)
    let userId = Column("userid")
    let startDate = Column("startdate")
    let endDate = Column("enddate")
    let reasonId = Column("reasonid")
    let details = Column("details")
}

struct Record: Model {
    var recordId: Int
    var userId: Int
    var startDate: Date
    var endDate: Date
    var reasonId: Int
    var details: String
    
    var reason: Reason?
    
    init?(row: [String: Any?]) {
        guard let recordIdNumber = row["recordid"] as? NSNumber,
        let reasonIdNumber = row["reasonid"] as? NSNumber,
        let userIdNumber = row["userid"] as? NSNumber,
        let startDate = row["startdate"] as? Date,
        let details = row["details"] as? String,
        let endDate = row["enddate"] as? Date,
        let reason = Reason(row: row) else {
                return nil
        }
        recordId = recordIdNumber.intValue
        userId = userIdNumber.intValue
        reasonId = reasonIdNumber.intValue
        self.startDate = startDate
        self.endDate = endDate
        self.reason = reason
        self.details = details
    }
}
