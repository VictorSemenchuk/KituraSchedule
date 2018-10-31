//
//  Record.swift
//  Application
//
//  Created by serverVITK on 10/25/18.
//

import Foundation
import KituraKit

struct RecordParams: QueryParams {
    var userId:Int
}

struct Record: Codable {
    var recordId: Int
    var userId: Int
    var startDate: Date
    var endDate: Date
    var reasonId: Int
    var details:String
    
    var reason: Reason?
}
