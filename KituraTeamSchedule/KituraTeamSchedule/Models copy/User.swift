//
//  User.swift
//  Application
//
//  Created by serverVITK on 10/25/18.
//

import Foundation
import SwiftKueryORM

struct User: Codable {
    var id: Int
    var firstName: String
    var lastName: String
    
    var records: [Record]?
    var cred: Cred?
}
