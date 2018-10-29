//
//  Reason.swift
//  Application
//
//  Created by serverVITK on 10/25/18.
//

import Foundation
import SwiftKuery
import SwiftKueryORM

class ReasonsTable: Table {
    let tableName = "Reasons"
    
    let id = Column("reasonid")
    let title = Column("title")
    let colorId = Column("colorid")
}

struct Reason: Model {
    var reasonId: Int
    var title: String
    var colorId: Int
    
    var color: Color?
    
    init?(row: [String: Any?]) {
        guard let numberId = row["reasonid"] as? NSNumber,
            let title = row["title"] as? String,
            let colorId = row["colorid"] as? NSNumber,
            let color = Color(row: row) else {
                return nil
        }
        self.reasonId = numberId.intValue
        self.title = title
        self.colorId = colorId.intValue
        self.color = color
    }
}
