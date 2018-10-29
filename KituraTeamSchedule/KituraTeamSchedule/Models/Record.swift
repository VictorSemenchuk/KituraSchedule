//
//  Record.swift
//  Application
//
//  Created by serverVITK on 10/25/18.
//

import Foundation

struct Record: Codable {
    var recordId: Int
    var userId: Int
    var startDate: Date
    var endDate: Date
    var reasonId: Int
    
    var reason: Reason?
}
